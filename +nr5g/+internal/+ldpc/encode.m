function codeword = encode(infoBits,bgn,Zc)
% LDPC Encode using the base graph structure
%
%   Note: This is an internal undocumented function and its API and/or
%   functionality may change in subsequent releases.
%
%   See also nrLDPCEncode.

%   Copyright 2018 The MathWorks, Inc.

%#codegen 

    persistent bgs
    if isempty(bgs)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph');
    end

    % Get lifting set number
    ZSets = {[2  4  8  16  32  64 128 256],... % Set 1
             [3  6 12  24  48  96 192 384],... % Set 2
             [5 10 20  40  80 160 320],...     % Set 3
             [7 14 28  56 112 224],...         % Set 4
             [9 18 36  72 144 288],...         % Set 5
             [11 22 44  88 176 352],...        % Set 6
             [13 26 52 104 208],...            % Set 7
             [15 30 60 120 240]};              % Set 8
    for setIdx = 1:8    % LDPC lifting size set index
        if any(Zc==ZSets{setIdx})
            break;
        end
    end

    % Get the matrix with base graph number 'bgn' and set number 'setIdx'.
    % The element of matrix V in the following is H_BG(i,j)*V(i,j), where
    % H_BG(i,j) and V(i,j) are defined in TS 38.212 5.3.2; if V(i,j) is not
    % defined in Table 5.3.2-2 or Table 5.3.2-3, the elements are -1.
    switch bgn
        case 1
            switch setIdx
                case 1
                    V = bgs.BG1S1;
                case 2
                    V = bgs.BG1S2;
                case 3
                    V = bgs.BG1S3;
                case 4
                    V = bgs.BG1S4;
                case 5
                    V = bgs.BG1S5;
                case 6
                    V = bgs.BG1S6;
                case 7
                    V = bgs.BG1S7;
                otherwise % 8
                    V = bgs.BG1S8;
            end
        otherwise % bgn = 2
            switch setIdx
                case 1
                    V = bgs.BG2S1;
                case 2
                    V = bgs.BG2S2;
                case 3
                    V = bgs.BG2S3;
                case 4
                    V = bgs.BG2S4;
                case 5
                    V = bgs.BG2S5;
                case 6
                    V = bgs.BG2S6;
                case 7
                    V = bgs.BG2S7;
                otherwise % 8
                    V = bgs.BG2S8;
            end
    end
    % Pre-stored H types for each BGN and setIdx pair
    Htype = {3, 3, 3, 3, 3, 3, 2, 3;
             4, 4, 4, 1, 4, 4, 4, 1};

    % Get shift values matrix
    P = nr5g.internal.ldpc.calcShiftValues(V,Zc);
    
    P1 = P(:,1:(size(P,2) - size(P,1)));
    infoVec = reshape(infoBits,Zc,[]); % One code-block processing only
    d = blockMultiply(P1,infoVec);

    d0 = d(:,1:4);
    % Solve 4 equations for Htype * m = d0
    switch Htype{bgn,setIdx}
        case 1
            % H1 = [  1  0 -1 -1;
            %        -1  0  0 -1;
            %         0 -1  0  0;
            %         1 -1 -1  0 ];
            m1 = sum(d0, 2);
            m2 = d0(:,1) + m1([2:end 1]);
            m3 = d0(:,2) + m2;
            m4 = d0(:,3) + m1 + m3;

        case 2
            % H2 = [  0  0 -1 -1;
            %       105  0  0 -1;
            %        -1 -1  0  0;
            %         0 -1 -1  0 ];
            m1 = sum(d0, 2);
            shift = mod(105, Zc);
            if shift > 0
                m1 = m1([(end-shift+1):end 1:(end-shift)]);
            end
            m2 = d0(:,1) + m1;
            m4 = d0(:,4) + m1;
            m3 = d0(:,3) + m4;

        case 3
            % H3 = [  1  0 -1 -1;
            %         0  0  0 -1;
            %        -1 -1  0  0;
            %         1 -1 -1  0 ];
            m1 = sum(d0, 2);
            m2 = d0(:,1) + m1([2:end 1]);
            m3 = d0(:,2) + m1 + m2;
            m4 = d0(:,3) + m3;

        otherwise % == 4
            % H4 = [  0  0 -1 -1;
            %        -1  0  0 -1;
            %         1 -1  0  0;
            %         0 -1 -1  0 ];
            m1 = sum(d0, 2);
            m1 = m1([end 1:(end-1)]);
            m2 = d0(:,1) + m1;
            m3 = d0(:,2) + m2;
            m4 = d0(:,4) + m1;
    end
    
    % Get other parity bits
    P3 = P(5:end,size(P1,2)+(1:4));
    p = blockMultiply(P3, [m1 m2 m3 m4]) + d(:,5:end);
    % Form codeword
    codeword = [infoBits; mod([m1; m2; m3; m4; p(:)],2)];

end

function C = blockMultiply(A,B)

    C = zeros(size(B,1),size(A,1));
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            if A(i,j) ~= -1     % -1 means a zero submatrix
                C(:,i) = C(:,i) + B([(A(i,j)+1):end 1:A(i,j)],j);
            end
        end
    end
end

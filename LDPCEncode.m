function out = LDPCEncode(in,bgn)
%nrLDPCEncode LDPC encoding
%   OUT = nrLDPCEncode(IN,BGN) returns the result of LDPC encoding in the
%   matrix OUT, based on input data matrix IN and base graph number (1 or
%   2), according to the rules of TS 38.212 Section 5.3.2.
%
%   Each column in IN and OUT represents a code block segment before and
%   after LPDC encoding, respectively. The number of columns in IN or OUT
%   is equal to the number of scheduled code block segments. The number of
%   rows in IN is the number of information bits in an LDPC codeword; the
%   number of rows in OUT is the length of codeword with some information
%   bits punctured. The encoding procedure includes replacing filler bits
%   (represented by -1) with 0 bits, encoding to generate the full LDPC
%   codeword, replacing the filler bit locations in codeword with -1 and
%   information bits puncturing.
%
%   % Example:
%   % LDPC encode two code block segments of length 2560 each (include 36
%   % filler bits at the end) to obtain two encoded code blocks of length
%   % 12800, respectively.
%
%   bgn = 2;               % Base graph number
%   K = 2560;              % Code block segment length
%   F = 36;                % Number of filler bits per code block segment
%   C = 2;                 % Number of code blocks
%   cbs = ones(K-F,C);  
%   fillers = -1*ones(F,C);
%   cbs = [cbs;fillers];   % Code block segments with filler bits
%   codedcbs = nrLDPCEncode(cbs,bgn);
%   size(codedcbs)
%
%   See also nrLDPCDecode, nrCodeBlockSegmentLDPC, nrCRCEncode,
%   nrRateMatchLDPC, nrDLSCHInfo.

%   Copyright 2018 The MathWorks, Inc.

%#codegen

    persistent encoder;

    % Validate input
    fcnName = 'nrLDPCEncode';
    validateattributes(in,{'int8','double'},{'2d'},fcnName,'IN');

    % Validate base graph number (1 or 2)
    validateattributes(bgn,{'numeric'},{'scalar','integer'},fcnName,'BGN');  
    coder.internal.errorIf(~(bgn==1 || bgn==2), ...
        'nr5g:nrLDPC:InvalidBGN',bgn);

    % Empty in, empty out
    typeIn = class(in);
    if isempty(in)
        out = zeros(0,size(in,2),typeIn);
        return;
    end

    % Obtain input/output size
    [K,C] = size(in);
    if bgn==1
        nsys = 22;
        ncwnodes = 66;
    else
        nsys = 10;
        ncwnodes = 50;
    end
    Zc = K/nsys;
    % Validate input data length
    coder.internal.errorIf(fix(Zc)~=Zc, ...
        'nr5g:nrLDPC:InvalidInputLength',K,nsys,bgn);
    %   Check against all supported lifting sizes
    ZcVec = [2:16 18:2:32 36:4:64 72:8:128 144:16:256 288:32:384];
    coder.internal.errorIf(~any(Zc==ZcVec),'nr5g:nrLDPC:InvalidZc',Zc,bgn);
    N = Zc*ncwnodes;

    if isempty(coder.target) % Simulation path

        % Get LDPC parameters for the bgn, Zc value pair
        [rows, cols] = nr5g.internal.ldpc.getParams(bgn,Zc);

        if isempty(encoder)
            encoder = comm.LDPCEncoder([rows cols]);
        else
            if ~isequal(encoder.ParityCheckMatrix, [rows cols])
                release(encoder);
                encoder.ParityCheckMatrix = [rows cols];
            end
        end

        % Find filler bits (shortening bits) and replace them with 0 bits
        %   filler bit locations are same for all code blocks
        locs = find(in(:,1)==-1);
        in(locs,:) = 0;

        % Encode each code block
        out = zeros(N,C,typeIn);
        for r = 1:C
            % LDPC encode
            outCB = encoder(int8(in(:,r)));

            % Put filler bits back
            outCB(locs) = -1;

            % Puncture 2*Zc systematic bits
            outCB(1:2*Zc) = [];
            out(:,r) = cast(outCB,typeIn);
        end

    else % codegen path

        % Find filler bits (shortening bits) and replace them with 0 bits
        locs = find(in(:,1)==-1);
        in(locs,:) = 0;

        % Encode each code block
        out = zeros(N,C,typeIn);
        for r = 1:C
            % LDPC encode
            outCB = nr5g.internal.ldpc.encode(double(in(:,r)),bgn,Zc);

            % Put filler bits back
            outCB(locs) = -1;

            % Puncture first 2*Zc systematic bits and output
            out(:,r) = cast(outCB(2*Zc+1:end),typeIn);
        end
    end

end

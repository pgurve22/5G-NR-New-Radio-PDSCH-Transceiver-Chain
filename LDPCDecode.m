function [out,actNumIter,finalParityChecks] = LDPCDecode(in,bgn, ...
        maxNumIter,varargin)
%nrLDPCDecode LDPC decoding
%   [OUT,ACTNUMITER,FINALPARITYCHECKS] = nrLDPCDecode(IN,BGN,MAXNUMITER)
%   returns the result of LDPC decoding in the matrix OUT based on soft
%   input matrix IN, base graph number BGN (1 or 2), and a maximum number
%   of decoding iterations MAXNUMITER. The decoder uses the sum-product
%   message passing algorithm and expects the data bits to be LDPC encoded 
%   as defined in TS 38.212 Section 5.3.2.
%
%   Each column in IN and OUT represents a code block segment before and
%   after LPDC decoding, respectively. The number of columns in IN or OUT
%   is equal to the number of scheduled code block segments. The number of
%   rows in IN is the length of codeword with some information bits
%   punctured, the number of rows in OUT is the number of information bits
%   in an LDPC codeword. The decoding is terminated when the parity checks
%   are satisfied, using MAXNUMITER as the maximum number of decoding
%   iterations. The decoding procedure includes padding of the punctured
%   bits to recover the full codeword and decoding to get the complete LDPC
%   information bits (including the punctured bits).
%
%   ACTNUMITER is a row vector of positive integer(s) whose length is equal
%   to the number of columns of IN. The i-th element corresponds to the
%   actual number of decoding iterations executed for the i-th column of
%   IN.
%
%   FINALPARITYCHECKS is a matrix that holds the final parity checks. The
%   i-th column corresponds to the final parity checks for the i-th
%   codeword. The number of rows is equal to the number of parity-check
%   bits in an LDPC codeword.
%
%   [OUT,ACTNUMITER,FINALPARITYCHECKS] = nrLDPCDecode(IN,BGN,MAXNUMITER,
%   ...,Name,Value) specifies additional name-value pair arguments
%   described below:
%
%   'OutputFormat' - One of 'info', 'whole', specifies the output format.
%                    OUT contains decoded information bits (default) or
%                    whole LDPC codeword bits. For 'info', the number of
%                    rows in OUT is the length of the information bits and
%                    for 'whole', the number of rows in OUT is the codeword
%                    length.
%   'DecisionType' - One of 'hard', 'soft', specifies the decision type
%                    used for decoding. For 'hard' (default), output is
%                    decoded bits of 'int8' type. For 'soft', output is
%                    log-likelihood ratios with the same type as input.
%   'Termination'  - One of 'early', 'max', specifies the decoding
%                    termination criteria. For 'early' (default), decoding
%                    is terminated when all parity checks are satisfied, up
%                    to a maximum number of iterations given by MAXNUMITER.
%                    For 'max', decoding continues till MAXNUMITER
%                    iterations are completed.
%
%   % Example:
%   % Two code blocks of length 2560 are encoded to obtain two code blocks
%   % of length 12800, the encoded bits are then converted to soft bits to
%   % be decoded by the LDPC decoder.
%
%   bgn = 2;                    % Base graph number
%   K = 2560;                   % Code block segment length
%   F = 36;                     % Number of filler bits per code block
%   C = 2;                      % Number of code blocks
%   txcbs = ones(K-F,C);
%   fillers = -1*ones(F,C);
%   txcbs = [txcbs;fillers];                % Add fillers
%   txcodedcbs = nrLDPCEncode(txcbs,bgn);   % Encode
%   
%   rxcodedcbs = double(1-2*txcodedcbs);    % Convert to soft bits
%   FillerIndices = find(txcodedcbs(:,1) == -1);
%   rxcodedcbs(FillerIndices,:) = 0;    % Fillers have no LLR information
% 
%   % Decode with a maximum of 25 iterations
%   [rxcbs, actualniters] = nrLDPCDecode(rxcodedcbs,bgn,25);
% 
%   txcbs(end-F+1:end,:) = 0;           % Replace filler bits with 0
% 
%   isequal(rxcbs,txcbs)                
%   actualniters
%
%   See also nrLDPCEncode, nrRateRecoverLDPC, nrCodeBlockDesegmentLDPC,
%   nrCRCDecode, nrDLSCHInfo.

%   Copyright 2018 The MathWorks, Inc.

%#codegen

    narginchk(3,9);

    params = validateInputs(in,bgn,maxNumIter,varargin{:});

    % Obtain input/output size
    [N,C] = size(in);
    typeIn = class(in);

    % Output empty if the input data is empty
    if isempty(in)
        if strcmp(params.DecisionType,'soft')
            out = zeros(0,C,typeIn);
        else
            out = zeros(0,C,'int8');
        end
        actNumIter = 0;
        finalParityChecks = zeros(0,C);
        return;
    end

    % LDPC decoding parameters
    if bgn==1
        ncwnodes = 66;
    else
        ncwnodes = 50;
    end
    Zc = N/ncwnodes;
    % Validate input data length
    coder.internal.errorIf(fix(Zc)~=Zc, ...
        'nr5g:nrLDPC:InvalidInputLength',N,ncwnodes,bgn);
    % Check Zc among all possible lifting sizes
    ZcVec = [2:16 18:2:32 36:4:64 72:8:128 144:16:256 288:32:384];
    coder.internal.errorIf( ~any(Zc==ZcVec),'nr5g:nrLDPC:InvalidZc',Zc,bgn);

    % Get LDPC parameters for the bgn, Zc value pair
    [rows, cols, NGrp, grplist, infoLen] = nr5g.internal.ldpc.getParams(bgn,Zc);
    infoLen = round(infoLen);

    % Add punctured 2*Zc information bits to recover the full codeword
    in = [zeros(2*Zc,C,typeIn); in];

    % Initialize outputs
    codewordLength = N + 2*Zc; % LDPC codeword length
    x_out = coder.nullcopy(zeros(codewordLength,C));
    finalParityChecks = coder.nullcopy(zeros(codewordLength-infoLen,C));
    actNumIter = coder.nullcopy(zeros(1,C));

    % Decode
    if isempty(coder.target) % Simulation path

        out = zeros(codewordLength,C);
        numParityBits = codewordLength - infoLen;
        rows = int32(rows-1);
        numRows= length(rows);
        numGrp = size(grplist,2);
        grplist = int32(grplist(:));
        compFinalParityChecks = (nargout == 3);

        for cwIndx = 1:C
            % C-Mex call, only doubles support
            [out(:,cwIndx),~, ~, ~,actNumIter(cwIndx), ...
                finalParityChecks(:,cwIndx)] = mwcomm_ldpcdecode(...
                double(in(:,cwIndx)),maxNumIter,codewordLength, ...
                numParityBits, numRows, numGrp, ...
                grplist, rows, int8(strcmp(params.DecisionType,'hard')), ...
                int8(strcmp(params.Termination,'early')), ...
                int8(compFinalParityChecks));
        end

        % Format output
        if strcmp(params.OutputFormat,'info')
            out = out(1:infoLen,:);
        end
        if strcmp(params.DecisionType,'hard')
            out = cast(out,'int8');
        else
            out = cast(out,typeIn);
        end

    else % codegen path

        % Initialize output to fix dimension and data type
        if strcmp(params.DecisionType,'soft')
            if strcmp(params.OutputFormat,'whole')
                out = coder.nullcopy(zeros(codewordLength,C,typeIn));
            else
                out = coder.nullcopy(zeros(infoLen,C,typeIn));
            end
        else
            if strcmp(params.OutputFormat,'whole')
                out = coder.nullcopy(zeros(codewordLength,C,'int8'));
            else
                out = coder.nullcopy(zeros(infoLen,C,'int8'));
            end
        end

        % Parity-check matrix for computing final parity checks
        H = zeros(codewordLength-infoLen, codewordLength);
        for i = 1:length(rows)
            H(rows(i),cols(i)) = 1;
        end

        % The sum-product algorithm
        for cwIndx = 1:C
            % Key variables inside the for loop: Lq, Lr, x_out

            Lq = in(cols, cwIndx);
            zeroLoc = zeros(size(Lq)); % Stores the location where Lq is zero

            numIter = 0;
            for iteration = 1:maxNumIter
                numIter = numIter+1;

                Lq = tanh(Lq/2);
                prodLq = ones(codewordLength-infoLen,1);

                % Variables for handling Lq's that are equal to zero
                NumOfRowsWithZeroTanh = 0;
                ChangedZeroloc = 0;

                % Calculate the product of Lq's
                % May need to handle the situation when some values are zero
                for nn = 1:length(rows)
                    if Lq(nn) ~= 0
                        prodLq(rows(nn)) = prodLq(rows(nn)) * Lq(nn);
                    else
                        % We must make sure that division by zero will not occur.
                        % Moreover, we need to compute Lr correctly before
                        % calculating x_out.

                        % Strategy:
                        %
                        % Let j (column index) be fixed.
                        %
                        % If L(q_{ij}) = 0 for exactly one i (say i0),
                        % then L(r_{ji}) = 0 for all i != i0,
                        % and for i = i0, L(r_{ji}) will be computed correctly
                        % if L(q_{ij}) is changed to any nonzero value.
                        %
                        % If L(q_{ij}) = 0 for two or more i's,
                        % then L(r_{ji}) = 0 for all i.

                        % First, change Lq to a nonzero value so that division
                        % by zero will not occur.

                        Lq(nn) = 1;
                        % Check if this is the first zero for this particular j
                        if zeroLoc(rows(nn)) == 0
                            % Yes, this is the first zero for this j.
                            % For now, assume that there are no more zeros,
                            % and store nn (which specifies i0),
                            % so that we may set L(r_{ji}) = 0 for all i != i0.
                            zeroLoc(rows(nn)) = nn;

                            % Keep track of the number of rows we need to fix
                            % For each j, NumOfRowsWithZeroTanh may be
                            % increased once only, because zeroLoc(rows(nn)) is
                            % no longer equal to 0.
                            NumOfRowsWithZeroTanh = NumOfRowsWithZeroTanh + 1;

                            % Make sure that zeroLoc will be cleared
                            % for next iteration
                            ChangedZeroloc = 1;

                            % No need to do
                            %   prodLq(rows(nn)) = prodLq(rows(nn)) * Lq(nn);
                            % because Lq(nn) has been changed to 1.
                        else
                            if zeroLoc(rows(nn)) > 0
                                % This is the second zero for this j.
                                % Just set prodLq(rows(nn)) = 0
                                % to force all L(r_{ji}) to 0 for all i.
                                prodLq(rows(nn)) = 0;
                                % Set zeroLoc(rows(nn)) = -1 to record the fact
                                % that there are two zeros already.
                                zeroLoc(rows(nn)) = -1;
                                % Keep track of the number of rows we need to fix
                                NumOfRowsWithZeroTanh = NumOfRowsWithZeroTanh - 1;
                            end
                        end
                    end
                end

                Lr = 2*atanh(prodLq(rows)./Lq);

                % atanh(x) approaches 19.07 as x approaches 1
                % atanh(x) approaches -19.07 as x approaches -1
                % Keep Lr finite to make subsequent summing operations meaningful
                Lr(Lr == Inf) = 2 * (19.07);
                Lr(Lr == -Inf) = 2 * (-19.07);

                % Fix those cases with a single zero
                if NumOfRowsWithZeroTanh > 0
                    for nn = 1:length(rows)
                        if (zeroLoc(rows(nn)) > 0) && (zeroLoc(rows(nn)) ~= nn)
                            Lr(nn) = 0;
                        end
                    end
                end

                if ChangedZeroloc
                    zeroLoc(:) = 0; % Reset for next iteration
                end

                % Initial value of the sums
                x_out(:, cwIndx) = double(in(:, cwIndx));

                % Calculate the sums
                offset1 = 0;
                offset2 = 0;
                for g = 1:NGrp  % Loop over all groups
                    x_out(offset1+(1:grplist(1,g)), cwIndx) = ...
                        x_out(offset1+(1:grplist(1,g)), cwIndx) + ...
                        sum(reshape(Lr(offset2+(1:grplist(1,g)*grplist(2,g))), ...
                        grplist(2,g), grplist(1,g)), 1)';
                    offset1 = offset1 + grplist(1,g);
                    offset2 = offset2 + grplist(1,g)*grplist(2,g);
                end

                Lq = x_out(cols, cwIndx) - Lr;

                if strcmp(params.Termination,'early')
                    % Compute the parity checks to see if the decoder can stop early
                    hardDecisions = double(x_out(:, cwIndx) <= 0);
                    finalParityChecks(:, cwIndx) = mod(H*hardDecisions,2);
                    if ~any(finalParityChecks(:, cwIndx))
                        break;
                    end
                end
            end

            % If necessary, compute the final parity checks
            if ~strcmp(params.Termination,'early') && (nargout == 3)
                hardDecisions = double(x_out(:, cwIndx) <= 0);
                finalParityChecks(:, cwIndx) = mod(H*hardDecisions,2);
            end

            actNumIter(cwIndx) = numIter;
        end

        % Format output
        if strcmp(params.DecisionType,'soft')
            if strcmp(params.OutputFormat,'whole')
                out(:) = cast(x_out,typeIn);
            else
                out(:) = cast(x_out(1:infoLen,:),typeIn);
            end
        else % Hard
            if strcmp(params.OutputFormat,'whole')
                out(:) = int8(x_out <= 0);
            else
                out(:) = int8(x_out(1:infoLen,:) <= 0);
            end
        end

    end

end


function params = validateInputs(in,bgn,maxNumIter,varargin)
% Check and parse input parameters

    coder.extrinsic('nr5g.internal.parseOptions');
    fcnName = 'nrLDPCDecode';

    % Validate the input soft data
    validateattributes(in,{'double','single'},{'2d'},fcnName,'IN');

    % Validate the input base graph number (1 or 2)
    validateattributes(bgn,{'numeric'},{'scalar','integer'},fcnName,'BGN');  
    coder.internal.errorIf(~(bgn==1||bgn==2),'nr5g:nrLDPC:InvalidBGN',bgn);

    % Validate the maximum number of iterations
    validateattributes(maxNumIter, {'numeric'}, ...
        {'real','scalar','integer','finite','>',0},fcnName,'MAXNUMITER');  

    % Parse and validate the optional params
    params = coder.const(nr5g.internal.parseOptions(fcnName, ...
        {'OutputFormat','DecisionType','Termination'},varargin{:}));        

end

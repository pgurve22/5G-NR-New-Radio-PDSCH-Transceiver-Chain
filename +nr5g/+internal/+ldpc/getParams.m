function [rows, cols, NGrp, grplist, infoLen] = getParams(bgn,Zc)
%getParams LDPC Parameters
%
%   Note: This is an internal undocumented function and its API and/or
%   functionality may change in subsequent releases.
%
%   See also nrLDPCEncode, nrLDPCDecode.

%   Copyright 2018 The MathWorks, Inc.

%#codegen

if bgn == 1
    switch Zc
        % Set 1
        case 2
            [rows, cols, NGrp, grplist, infoLen] = d_1_2params(Zc);
        case 4
            [rows, cols, NGrp, grplist, infoLen] = d_1_4params(Zc);
        case 8
            [rows, cols, NGrp, grplist, infoLen] = d_1_8params(Zc);
        case 16
            [rows, cols, NGrp, grplist, infoLen] = d_1_16params(Zc);
        case 32
            [rows, cols, NGrp, grplist, infoLen] = d_1_32params(Zc);
        case 64
            [rows, cols, NGrp, grplist, infoLen] = d_1_64params(Zc);
        case 128
            [rows, cols, NGrp, grplist, infoLen] = d_1_128params(Zc);
        case 256
            [rows, cols, NGrp, grplist, infoLen] = d_1_256params(Zc);
        % Set 2
        case 3
            [rows, cols, NGrp, grplist, infoLen] = d_1_3params(Zc);
        case 6
            [rows, cols, NGrp, grplist, infoLen] = d_1_6params(Zc);
        case 12
            [rows, cols, NGrp, grplist, infoLen] = d_1_12params(Zc);
        case 24
            [rows, cols, NGrp, grplist, infoLen] = d_1_24params(Zc);
        case 48
            [rows, cols, NGrp, grplist, infoLen] = d_1_48params(Zc);
        case 96
            [rows, cols, NGrp, grplist, infoLen] = d_1_96params(Zc);
        case 192
            [rows, cols, NGrp, grplist, infoLen] = d_1_192params(Zc);
        case 384
            [rows, cols, NGrp, grplist, infoLen] = d_1_384params(Zc);  
        % Set 3
        case 5
            [rows, cols, NGrp, grplist, infoLen] = d_1_5params(Zc);
        case 10
            [rows, cols, NGrp, grplist, infoLen] = d_1_10params(Zc);
        case 20
            [rows, cols, NGrp, grplist, infoLen] = d_1_20params(Zc);
        case 40
            [rows, cols, NGrp, grplist, infoLen] = d_1_40params(Zc);
        case 80
            [rows, cols, NGrp, grplist, infoLen] = d_1_80params(Zc);
        case 160
            [rows, cols, NGrp, grplist, infoLen] = d_1_160params(Zc);
        case 320
            [rows, cols, NGrp, grplist, infoLen] = d_1_320params(Zc); 
        % Set 4
        case 7
            [rows, cols, NGrp, grplist, infoLen] = d_1_7params(Zc);
        case 14
            [rows, cols, NGrp, grplist, infoLen] = d_1_14params(Zc);
        case 28
            [rows, cols, NGrp, grplist, infoLen] = d_1_28params(Zc);
        case 56
            [rows, cols, NGrp, grplist, infoLen] = d_1_56params(Zc);
        case 112
            [rows, cols, NGrp, grplist, infoLen] = d_1_112params(Zc);
        case 224
            [rows, cols, NGrp, grplist, infoLen] = d_1_224params(Zc);  
        % Set 5
        case 9
            [rows, cols, NGrp, grplist, infoLen] = d_1_9params(Zc);
        case 18
            [rows, cols, NGrp, grplist, infoLen] = d_1_18params(Zc);
        case 36
            [rows, cols, NGrp, grplist, infoLen] = d_1_36params(Zc);
        case 72
            [rows, cols, NGrp, grplist, infoLen] = d_1_72params(Zc);
        case 144
            [rows, cols, NGrp, grplist, infoLen] = d_1_144params(Zc);
        case 288
            [rows, cols, NGrp, grplist, infoLen] = d_1_288params(Zc); 
        % Set 6
        case 11
            [rows, cols, NGrp, grplist, infoLen] = d_1_11params(Zc);
        case 22
            [rows, cols, NGrp, grplist, infoLen] = d_1_22params(Zc);
        case 44
            [rows, cols, NGrp, grplist, infoLen] = d_1_44params(Zc);
        case 88
            [rows, cols, NGrp, grplist, infoLen] = d_1_88params(Zc);
        case 176
            [rows, cols, NGrp, grplist, infoLen] = d_1_176params(Zc);
        case 352
            [rows, cols, NGrp, grplist, infoLen] = d_1_352params(Zc);
        % Set 7
        case 13
            [rows, cols, NGrp, grplist, infoLen] = d_1_13params(Zc);
        case 26
            [rows, cols, NGrp, grplist, infoLen] = d_1_26params(Zc);
        case 52
            [rows, cols, NGrp, grplist, infoLen] = d_1_52params(Zc);
        case 104
            [rows, cols, NGrp, grplist, infoLen] = d_1_104params(Zc);
        case 208
            [rows, cols, NGrp, grplist, infoLen] = d_1_208params(Zc); 
        % Set 8
        case 15
            [rows, cols, NGrp, grplist, infoLen] = d_1_15params(Zc);
        case 30
            [rows, cols, NGrp, grplist, infoLen] = d_1_30params(Zc);
        case 60
            [rows, cols, NGrp, grplist, infoLen] = d_1_60params(Zc);
        case 120
            [rows, cols, NGrp, grplist, infoLen] = d_1_120params(Zc);
        otherwise %240
            [rows, cols, NGrp, grplist, infoLen] = d_1_240params(Zc);
    end
else % nbg == 2
    switch Zc
        % Set 1
        case 2
            [rows, cols, NGrp, grplist, infoLen] = d_2_2params(Zc);
        case 4
            [rows, cols, NGrp, grplist, infoLen] = d_2_4params(Zc);
        case 8
            [rows, cols, NGrp, grplist, infoLen] = d_2_8params(Zc);
        case 16
            [rows, cols, NGrp, grplist, infoLen] = d_2_16params(Zc);
        case 32
            [rows, cols, NGrp, grplist, infoLen] = d_2_32params(Zc);
        case 64
            [rows, cols, NGrp, grplist, infoLen] = d_2_64params(Zc);
        case 128
            [rows, cols, NGrp, grplist, infoLen] = d_2_128params(Zc);
        case 256
            [rows, cols, NGrp, grplist, infoLen] = d_2_256params(Zc); 
        % Set 2
        case 3
            [rows, cols, NGrp, grplist, infoLen] = d_2_3params(Zc);
        case 6
            [rows, cols, NGrp, grplist, infoLen] = d_2_6params(Zc);
        case 12
            [rows, cols, NGrp, grplist, infoLen] = d_2_12params(Zc);
        case 24
            [rows, cols, NGrp, grplist, infoLen] = d_2_24params(Zc);
        case 48
            [rows, cols, NGrp, grplist, infoLen] = d_2_48params(Zc);
        case 96
            [rows, cols, NGrp, grplist, infoLen] = d_2_96params(Zc);
        case 192
            [rows, cols, NGrp, grplist, infoLen] = d_2_192params(Zc);
        case 384
            [rows, cols, NGrp, grplist, infoLen] = d_2_384params(Zc);  
        % Set 3
        case 5
            [rows, cols, NGrp, grplist, infoLen] = d_2_5params(Zc);
        case 10
            [rows, cols, NGrp, grplist, infoLen] = d_2_10params(Zc);
        case 20
            [rows, cols, NGrp, grplist, infoLen] = d_2_20params(Zc);
        case 40
            [rows, cols, NGrp, grplist, infoLen] = d_2_40params(Zc);
        case 80
            [rows, cols, NGrp, grplist, infoLen] = d_2_80params(Zc);
        case 160
            [rows, cols, NGrp, grplist, infoLen] = d_2_160params(Zc);
        case 320
            [rows, cols, NGrp, grplist, infoLen] = d_2_320params(Zc);
        % Set 4
        case 7
            [rows, cols, NGrp, grplist, infoLen] = d_2_7params(Zc);
        case 14
            [rows, cols, NGrp, grplist, infoLen] = d_2_14params(Zc);
        case 28
            [rows, cols, NGrp, grplist, infoLen] = d_2_28params(Zc);
        case 56
            [rows, cols, NGrp, grplist, infoLen] = d_2_56params(Zc);
        case 112
            [rows, cols, NGrp, grplist, infoLen] = d_2_112params(Zc);
        case 224
            [rows, cols, NGrp, grplist, infoLen] = d_2_224params(Zc);
        % Set 5
        case 9
            [rows, cols, NGrp, grplist, infoLen] = d_2_9params(Zc);
        case 18
            [rows, cols, NGrp, grplist, infoLen] = d_2_18params(Zc);
        case 36
            [rows, cols, NGrp, grplist, infoLen] = d_2_36params(Zc);
        case 72
            [rows, cols, NGrp, grplist, infoLen] = d_2_72params(Zc);
        case 144
            [rows, cols, NGrp, grplist, infoLen] = d_2_144params(Zc);
        case 288
            [rows, cols, NGrp, grplist, infoLen] = d_2_288params(Zc);
        % Set 6
        case 11
            [rows, cols, NGrp, grplist, infoLen] = d_2_11params(Zc);
        case 22
            [rows, cols, NGrp, grplist, infoLen] = d_2_22params(Zc);
        case 44
            [rows, cols, NGrp, grplist, infoLen] = d_2_44params(Zc);
        case 88
            [rows, cols, NGrp, grplist, infoLen] = d_2_88params(Zc);
        case 176
            [rows, cols, NGrp, grplist, infoLen] = d_2_176params(Zc);
        case 352
            [rows, cols, NGrp, grplist, infoLen] = d_2_352params(Zc);
        % Set 7
        case 13
            [rows, cols, NGrp, grplist, infoLen] = d_2_13params(Zc);
        case 26
            [rows, cols, NGrp, grplist, infoLen] = d_2_26params(Zc);
        case 52
            [rows, cols, NGrp, grplist, infoLen] = d_2_52params(Zc);
        case 104
            [rows, cols, NGrp, grplist, infoLen] = d_2_104params(Zc);
        case 208
            [rows, cols, NGrp, grplist, infoLen] = d_2_208params(Zc);
        % Set 8
        case 15
            [rows, cols, NGrp, grplist, infoLen] = d_2_15params(Zc);
        case 30
            [rows, cols, NGrp, grplist, infoLen] = d_2_30params(Zc);
        case 60
            [rows, cols, NGrp, grplist, infoLen] = d_2_60params(Zc);
        case 120
            [rows, cols, NGrp, grplist, infoLen] = d_2_120params(Zc);
        otherwise % 240
            [rows, cols, NGrp, grplist, infoLen] = d_2_240params(Zc);
    end
end

end


%% Functions to get LDPC decoding parameters per Zc, BGN pair

% For Base graph 1, Set 1
function [rows, cols, NGrp, grplist, infoLen] = d_1_2params(Zc)
    persistent d_1_2
    infoLen = 22*Zc;
    if isempty(d_1_2)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S1');
        V = bgs.BG1S1;
        H = parityCheckMatrix(V, Zc);
        d_1_2 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_2);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_4params(Zc)
    persistent d_1_4
    infoLen = 22*Zc;
    if isempty(d_1_4)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S1');
        V = bgs.BG1S1;
        H = parityCheckMatrix(V, Zc);
        d_1_4 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_4);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_8params(Zc)
    persistent d_1_8
    infoLen = 22*Zc;
    if isempty(d_1_8)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S1');
        V = bgs.BG1S1;
        H = parityCheckMatrix(V, Zc);
        d_1_8 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_8);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_16params(Zc)
    persistent d_1_16
    infoLen = 22*Zc;
    if isempty(d_1_16)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S1');
        V = bgs.BG1S1;
        H = parityCheckMatrix(V, Zc);
        d_1_16 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_16);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_32params(Zc)
    persistent d_1_32
    infoLen = 22*Zc;
    if isempty(d_1_32)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S1');
        V = bgs.BG1S1;
        H = parityCheckMatrix(V, Zc);
        d_1_32 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_32);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_64params(Zc)
    persistent d_1_64
    infoLen = 22*Zc;
    if isempty(d_1_64)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S1');
        V = bgs.BG1S1;
        H = parityCheckMatrix(V, Zc);
        d_1_64 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_64);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_128params(Zc)
    persistent d_1_128
    infoLen = 22*Zc;
    if isempty(d_1_128)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S1');
        V = bgs.BG1S1;
        H = parityCheckMatrix(V, Zc);
        d_1_128 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_128);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_256params(Zc)
    persistent d_1_256
    infoLen = 22*Zc;
    if isempty(d_1_256)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S1');
        V = bgs.BG1S1;
        H = parityCheckMatrix(V, Zc);
        d_1_256 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_256);
end

% For Base graph 1, Set 2
function [rows, cols, NGrp, grplist, infoLen] = d_1_3params(Zc)
    persistent d_1_3
    infoLen = 22*Zc;
    if isempty(d_1_3)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S2');
        V = bgs.BG1S2;
        H = parityCheckMatrix(V, Zc);
        d_1_3 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_3);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_6params(Zc)
    persistent d_1_6
    infoLen = 22*Zc;
    if isempty(d_1_6)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S2');
        V = bgs.BG1S2;
        H = parityCheckMatrix(V, Zc);
        d_1_6 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_6);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_12params(Zc)
    persistent d_1_12
    infoLen = 22*Zc;
    if isempty(d_1_12)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S2');
        V = bgs.BG1S2;
        H = parityCheckMatrix(V, Zc);
        d_1_12 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_12);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_24params(Zc)
    persistent d_1_24
    infoLen = 22*Zc;
    if isempty(d_1_24)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S2');
        V = bgs.BG1S2;
        H = parityCheckMatrix(V, Zc);
        d_1_24 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_24);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_48params(Zc)
    persistent d_1_48
    infoLen = 22*Zc;
    if isempty(d_1_48)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S2');
        V = bgs.BG1S2;
        H = parityCheckMatrix(V, Zc);
        d_1_48 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_48);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_96params(Zc)
    persistent d_1_96
    infoLen = 22*Zc;
    if isempty(d_1_96)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S2');
        V = bgs.BG1S2;
        H = parityCheckMatrix(V, Zc);
        d_1_96 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_96);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_192params(Zc)
    persistent d_1_192
    infoLen = 22*Zc;
    if isempty(d_1_192)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S2');
        V = bgs.BG1S2;
        H = parityCheckMatrix(V, Zc);
        d_1_192 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_192);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_384params(Zc)
    persistent d_1_384
    infoLen = 22*Zc;
    if isempty(d_1_384)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S2');
        V = bgs.BG1S2;
        H = parityCheckMatrix(V, Zc);
        d_1_384 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_384);
end

% For Base graph 1, Set 3
function [rows, cols, NGrp, grplist, infoLen] = d_1_5params(Zc)
    persistent d_1_5
    infoLen = 22*Zc;
    if isempty(d_1_5)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S3');
        V = bgs.BG1S3;
        H = parityCheckMatrix(V, Zc);
        d_1_5 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_5);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_10params(Zc)
    persistent d_1_10
    infoLen = 22*Zc;
    if isempty(d_1_10)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S3');
        V = bgs.BG1S3;
        H = parityCheckMatrix(V, Zc);
        d_1_10 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_10);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_20params(Zc)
    persistent d_1_20
    infoLen = 22*Zc;
    if isempty(d_1_20)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S3');
        V = bgs.BG1S3;
        H = parityCheckMatrix(V, Zc);
        d_1_20 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_20);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_40params(Zc)
    persistent d_1_40
    infoLen = 22*Zc;
    if isempty(d_1_40)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S3');
        V = bgs.BG1S3;
        H = parityCheckMatrix(V, Zc);
        d_1_40 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_40);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_80params(Zc)
    persistent d_1_80
    infoLen = 22*Zc;
    if isempty(d_1_80)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S3');
        V = bgs.BG1S3;
        H = parityCheckMatrix(V, Zc);
        d_1_80 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_80);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_160params(Zc)
    persistent d_1_160
    infoLen = 22*Zc;
    if isempty(d_1_160)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S3');
        V = bgs.BG1S3;
        H = parityCheckMatrix(V, Zc);
        d_1_160 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_160);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_320params(Zc)
    persistent d_1_320
    infoLen = 22*Zc;
    if isempty(d_1_320)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S3');
        V = bgs.BG1S3;
        H = parityCheckMatrix(V, Zc);
        d_1_320 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_320);
end

% For Base graph 1, Set 4
function [rows, cols, NGrp, grplist, infoLen] = d_1_7params(Zc)
    persistent d_1_7
    infoLen = 22*Zc;
    if isempty(d_1_7)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S4');
        V = bgs.BG1S4;
        H = parityCheckMatrix(V, Zc);
        d_1_7 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_7);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_14params(Zc)
    persistent d_1_14
    infoLen = 22*Zc;
    if isempty(d_1_14)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S4');
        V = bgs.BG1S4;
        H = parityCheckMatrix(V, Zc);
        d_1_14 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_14);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_28params(Zc)
    persistent d_1_28
    infoLen = 22*Zc;
    if isempty(d_1_28)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S4');
        V = bgs.BG1S4;
        H = parityCheckMatrix(V, Zc);
        d_1_28 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_28);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_56params(Zc)
    persistent d_1_56
    infoLen = 22*Zc;
    if isempty(d_1_56)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S4');
        V = bgs.BG1S4;
        H = parityCheckMatrix(V, Zc);
        d_1_56 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_56);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_112params(Zc)
    persistent d_1_112
    infoLen = 22*Zc;
    if isempty(d_1_112)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S4');
        V = bgs.BG1S4;
        H = parityCheckMatrix(V, Zc);
        d_1_112 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_112);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_224params(Zc)
    persistent d_1_224
    infoLen = 22*Zc;
    if isempty(d_1_224)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S4');
        V = bgs.BG1S4;
        H = parityCheckMatrix(V, Zc);
        d_1_224 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_224);
end

% For Base graph 1, Set 5
function [rows, cols, NGrp, grplist, infoLen] = d_1_9params(Zc)
    persistent d_1_9
    infoLen = 22*Zc;
    if isempty(d_1_9)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S5');
        V = bgs.BG1S5;
        H = parityCheckMatrix(V, Zc);
        d_1_9 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_9);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_18params(Zc)
    persistent d_1_18
    infoLen = 22*Zc;
    if isempty(d_1_18)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S5');
        V = bgs.BG1S5;
        H = parityCheckMatrix(V, Zc);
        d_1_18 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_18);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_36params(Zc)
    persistent d_1_36
    infoLen = 22*Zc;
    if isempty(d_1_36)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S5');
        V = bgs.BG1S5;
        H = parityCheckMatrix(V, Zc);
        d_1_36 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_36);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_72params(Zc)
    persistent d_1_72
    infoLen = 22*Zc;
    if isempty(d_1_72)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S5');
        V = bgs.BG1S5;
        H = parityCheckMatrix(V, Zc);
        d_1_72 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_72);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_144params(Zc)
    persistent d_1_144
    infoLen = 22*Zc;
    if isempty(d_1_144)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S5');
        V = bgs.BG1S5;
        H = parityCheckMatrix(V, Zc);
        d_1_144 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_144);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_288params(Zc)
    persistent d_1_288
    infoLen = 22*Zc;
    if isempty(d_1_288)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S5');
        V = bgs.BG1S5;
        H = parityCheckMatrix(V, Zc);
        d_1_288 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_288);
end

% For Base graph 1, Set 6
function [rows, cols, NGrp, grplist, infoLen] = d_1_11params(Zc)
    persistent d_1_11
    infoLen = 22*Zc;
    if isempty(d_1_11)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S6');
        V = bgs.BG1S6;
        H = parityCheckMatrix(V, Zc);
        d_1_11 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_11);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_22params(Zc)
    persistent d_1_22
    infoLen = 22*Zc;
    if isempty(d_1_22)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S6');
        V = bgs.BG1S6;
        H = parityCheckMatrix(V, Zc);
        d_1_22 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_22);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_44params(Zc)
    persistent d_1_44
    infoLen = 22*Zc;
    if isempty(d_1_44)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S6');
        V = bgs.BG1S6;
        H = parityCheckMatrix(V, Zc);
        d_1_44 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_44);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_88params(Zc)
    persistent d_1_88
    infoLen = 22*Zc;
    if isempty(d_1_88)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S6');
        V = bgs.BG1S6;
        H = parityCheckMatrix(V, Zc);
        d_1_88 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_88);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_176params(Zc)
    persistent d_1_176
    infoLen = 22*Zc;
    if isempty(d_1_176)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S6');
        V = bgs.BG1S6;
        H = parityCheckMatrix(V, Zc);
        d_1_176 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_176);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_352params(Zc)
    persistent d_1_352
    infoLen = 22*Zc;
    if isempty(d_1_352)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S6');
        V = bgs.BG1S6;
        H = parityCheckMatrix(V, Zc);
        d_1_352 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_352);
end

% For Base graph 1, Set 7
function [rows, cols, NGrp, grplist, infoLen] = d_1_13params(Zc)
    persistent d_1_13
    infoLen = 22*Zc;
    if isempty(d_1_13)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S7');
        V = bgs.BG1S7;
        H = parityCheckMatrix(V, Zc);
        d_1_13 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_13);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_26params(Zc)
    persistent d_1_26
    infoLen = 22*Zc;
    if isempty(d_1_26)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S7');
        V = bgs.BG1S7;
        H = parityCheckMatrix(V, Zc);
        d_1_26 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_26);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_52params(Zc)
    persistent d_1_52
    infoLen = 22*Zc;
    if isempty(d_1_52)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S7');
        V = bgs.BG1S7;
        H = parityCheckMatrix(V, Zc);
        d_1_52 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_52);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_104params(Zc)
    persistent d_1_104
    infoLen = 22*Zc;
    if isempty(d_1_104)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S7');
        V = bgs.BG1S7;
        H = parityCheckMatrix(V, Zc);
        d_1_104 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_104);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_208params(Zc)
    persistent d_1_208
    infoLen = 22*Zc;
    if isempty(d_1_208)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S7');
        V = bgs.BG1S7;
        H = parityCheckMatrix(V, Zc);
        d_1_208 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_208);
end

% For Base graph 1, Set 8
function [rows, cols, NGrp, grplist, infoLen] = d_1_15params(Zc)
    persistent d_1_15
    infoLen = 22*Zc;
    if isempty(d_1_15)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S8');
        V = bgs.BG1S8;
        H = parityCheckMatrix(V, Zc);
        d_1_15 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_15);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_30params(Zc)
    persistent d_1_30
    infoLen = 22*Zc;
    if isempty(d_1_30)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S8');
        V = bgs.BG1S8;
        H = parityCheckMatrix(V, Zc);
        d_1_30 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_30);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_60params(Zc)
    persistent d_1_60
    infoLen = 22*Zc;
    if isempty(d_1_60)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S8');
        V = bgs.BG1S8;
        H = parityCheckMatrix(V, Zc);
        d_1_60 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_60);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_120params(Zc)
    persistent d_1_120
    infoLen = 22*Zc;
    if isempty(d_1_120)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S8');
        V = bgs.BG1S8;
        H = parityCheckMatrix(V, Zc);
        d_1_120 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_120);
end

function [rows, cols, NGrp, grplist, infoLen] = d_1_240params(Zc)
    persistent d_1_240
    infoLen = 22*Zc;
    if isempty(d_1_240)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG1S8');
        V = bgs.BG1S8;
        H = parityCheckMatrix(V, Zc);
        d_1_240 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_1_240);
end

%%
% For Base graph 2, Set 1
function [rows, cols, NGrp, grplist, infoLen] = d_2_2params(Zc)
    persistent d_2_2
    infoLen = 10*Zc;
    if isempty(d_2_2)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S1');
        V = bgs.BG2S1;
        H = parityCheckMatrix(V, Zc);
        d_2_2 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_2);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_4params(Zc)
    persistent d_2_4
    infoLen = 10*Zc;
    if isempty(d_2_4)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S1');
        V = bgs.BG2S1;
        H = parityCheckMatrix(V, Zc);
        d_2_4 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_4);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_8params(Zc)
    persistent d_2_8
    infoLen = 10*Zc;
    if isempty(d_2_8)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S1');
        V = bgs.BG2S1;
        H = parityCheckMatrix(V, Zc);
        d_2_8 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_8);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_16params(Zc)
    persistent d_2_16
    infoLen = 10*Zc;
    if isempty(d_2_16)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S1');
        V = bgs.BG2S1;
        H = parityCheckMatrix(V, Zc);
        d_2_16 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_16);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_32params(Zc)
    persistent d_2_32
    infoLen = 10*Zc;
    if isempty(d_2_32)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S1');
        V = bgs.BG2S1;
        H = parityCheckMatrix(V, Zc);
        d_2_32 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_32);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_64params(Zc)
    persistent d_2_64
    infoLen = 10*Zc;
    if isempty(d_2_64)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S1');
        V = bgs.BG2S1;
        H = parityCheckMatrix(V, Zc);
        d_2_64 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_64);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_128params(Zc)
    persistent d_2_128
    infoLen = 10*Zc;
    if isempty(d_2_128)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S1');
        V = bgs.BG2S1;
        H = parityCheckMatrix(V, Zc);
        d_2_128 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_128);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_256params(Zc)
    persistent d_2_256
    infoLen = 10*Zc;
    if isempty(d_2_256)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S1');
        V = bgs.BG2S1;
        H = parityCheckMatrix(V, Zc);
        d_2_256 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_256);
end

% For Base graph 2, Set 2
function [rows, cols, NGrp, grplist, infoLen] = d_2_3params(Zc)
    persistent d_2_3
    infoLen = 10*Zc;
    if isempty(d_2_3)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S2');
        V = bgs.BG2S2;
        H = parityCheckMatrix(V, Zc);
        d_2_3 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_3);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_6params(Zc)
    persistent d_2_6
    infoLen = 10*Zc;
    if isempty(d_2_6)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S2');
        V = bgs.BG2S2;
        H = parityCheckMatrix(V, Zc);
        d_2_6 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_6);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_12params(Zc)
    persistent d_2_12
    infoLen = 10*Zc;
    if isempty(d_2_12)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S2');
        V = bgs.BG2S2;
        H = parityCheckMatrix(V, Zc);
        d_2_12 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_12);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_24params(Zc)
    persistent d_2_24
    infoLen = 10*Zc;
    if isempty(d_2_24)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S2');
        V = bgs.BG2S2;
        H = parityCheckMatrix(V, Zc);
        d_2_24 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_24);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_48params(Zc)
    persistent d_2_48
    infoLen = 10*Zc;
    if isempty(d_2_48)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S2');
        V = bgs.BG2S2;
        H = parityCheckMatrix(V, Zc);
        d_2_48 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_48);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_96params(Zc)
    persistent d_2_96
    infoLen = 10*Zc;
    if isempty(d_2_96)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S2');
        V = bgs.BG2S2;
        H = parityCheckMatrix(V, Zc);
        d_2_96 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_96);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_192params(Zc)
    persistent d_2_192
    infoLen = 10*Zc;
    if isempty(d_2_192)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S2');
        V = bgs.BG2S2;
        H = parityCheckMatrix(V, Zc);
        d_2_192 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_192);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_384params(Zc)
    persistent d_2_384
    infoLen = 10*Zc;
    if isempty(d_2_384)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S2');
        V = bgs.BG2S2;
        H = parityCheckMatrix(V, Zc);
        d_2_384 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_384);
end

% For Base graph 2, Set 3
function [rows, cols, NGrp, grplist, infoLen] = d_2_5params(Zc)
    persistent d_2_5
    infoLen = 10*Zc;
    if isempty(d_2_5)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S3');
        V = bgs.BG2S3;
        H = parityCheckMatrix(V, Zc);
        d_2_5 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_5);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_10params(Zc)
    persistent d_2_10
    infoLen = 10*Zc;
    if isempty(d_2_10)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S3');
        V = bgs.BG2S3;
        H = parityCheckMatrix(V, Zc);
        d_2_10 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_10);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_20params(Zc)
    persistent d_2_20
    infoLen = 10*Zc;
    if isempty(d_2_20)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S3');
        V = bgs.BG2S3;
        H = parityCheckMatrix(V, Zc);
        d_2_20 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_20);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_40params(Zc)
    persistent d_2_40
    infoLen = 10*Zc;
    if isempty(d_2_40)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S3');
        V = bgs.BG2S3;
        H = parityCheckMatrix(V, Zc);
        d_2_40 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_40);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_80params(Zc)
    persistent d_2_80
    infoLen = 10*Zc;
    if isempty(d_2_80)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S3');
        V = bgs.BG2S3;
        H = parityCheckMatrix(V, Zc);
        d_2_80 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_80);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_160params(Zc)
    persistent d_2_160
    infoLen = 10*Zc;
    if isempty(d_2_160)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S3');
        V = bgs.BG2S3;
        H = parityCheckMatrix(V, Zc);
        d_2_160 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_160);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_320params(Zc)
    persistent d_2_320
    infoLen = 10*Zc;
    if isempty(d_2_320)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S3');
        V = bgs.BG2S3;
        H = parityCheckMatrix(V, Zc);
        d_2_320 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_320);
end

% For Base graph 2, Set 4
function [rows, cols, NGrp, grplist, infoLen] = d_2_7params(Zc)
    persistent d_2_7
    infoLen = 10*Zc;
    if isempty(d_2_7)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S4');
        V = bgs.BG2S4;
        H = parityCheckMatrix(V, Zc);
        d_2_7 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_7);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_14params(Zc)
    persistent d_2_14
    infoLen = 10*Zc;
    if isempty(d_2_14)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S4');
        V = bgs.BG2S4;
        H = parityCheckMatrix(V, Zc);
        d_2_14 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_14);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_28params(Zc)
    persistent d_2_28
    infoLen = 10*Zc;
    if isempty(d_2_28)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S4');
        V = bgs.BG2S4;
        H = parityCheckMatrix(V, Zc);
        d_2_28 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_28);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_56params(Zc)
    persistent d_2_56
    infoLen = 10*Zc;
    if isempty(d_2_56)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S4');
        V = bgs.BG2S4;
        H = parityCheckMatrix(V, Zc);
        d_2_56 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_56);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_112params(Zc)
    persistent d_2_112
    infoLen = 10*Zc;
    if isempty(d_2_112)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S4');
        V = bgs.BG2S4;
        H = parityCheckMatrix(V, Zc);
        d_2_112 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_112);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_224params(Zc)
    persistent d_2_224
    infoLen = 10*Zc;
    if isempty(d_2_224)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S4');
        V = bgs.BG2S4;
        H = parityCheckMatrix(V, Zc);
        d_2_224 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_224);
end

% For Base graph 2, Set 5
function [rows, cols, NGrp, grplist, infoLen] = d_2_9params(Zc)
    persistent d_2_9
    infoLen = 10*Zc;
    if isempty(d_2_9)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S5');
        V = bgs.BG2S5;
        H = parityCheckMatrix(V, Zc);
        d_2_9 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_9);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_18params(Zc)
    persistent d_2_18
    infoLen = 10*Zc;
    if isempty(d_2_18)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S5');
        V = bgs.BG2S5;
        H = parityCheckMatrix(V, Zc);
        d_2_18 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_18);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_36params(Zc)
    persistent d_2_36
    infoLen = 10*Zc;
    if isempty(d_2_36)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S5');
        V = bgs.BG2S5;
        H = parityCheckMatrix(V, Zc);
        d_2_36 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_36);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_72params(Zc)
    persistent d_2_72
    infoLen = 10*Zc;
    if isempty(d_2_72)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S5');
        V = bgs.BG2S5;
        H = parityCheckMatrix(V, Zc);
        d_2_72 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_72);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_144params(Zc)
    persistent d_2_144
    infoLen = 10*Zc;
    if isempty(d_2_144)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S5');
        V = bgs.BG2S5;
        H = parityCheckMatrix(V, Zc);
        d_2_144 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_144);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_288params(Zc)
    persistent d_2_288
    infoLen = 10*Zc;
    if isempty(d_2_288)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S5');
        V = bgs.BG2S5;
        H = parityCheckMatrix(V, Zc);
        d_2_288 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_288);
end

% For Base graph 2, Set 6
function [rows, cols, NGrp, grplist, infoLen] = d_2_11params(Zc)
    persistent d_2_11
    infoLen = 10*Zc;
    if isempty(d_2_11)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S6');
        V = bgs.BG2S6;
        H = parityCheckMatrix(V, Zc);
        d_2_11 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_11);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_22params(Zc)
    persistent d_2_22
    infoLen = 10*Zc;
    if isempty(d_2_22)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S6');
        V = bgs.BG2S6;
        H = parityCheckMatrix(V, Zc);
        d_2_22 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_22);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_44params(Zc)
    persistent d_2_44
    infoLen = 10*Zc;
    if isempty(d_2_44)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S6');
        V = bgs.BG2S6;
        H = parityCheckMatrix(V, Zc);
        d_2_44 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_44);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_88params(Zc)
    persistent d_2_88
    infoLen = 10*Zc;
    if isempty(d_2_88)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S6');
        V = bgs.BG2S6;
        H = parityCheckMatrix(V, Zc);
        d_2_88 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_88);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_176params(Zc)
    persistent d_2_176
    infoLen = 10*Zc;
    if isempty(d_2_176)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S6');
        V = bgs.BG2S6;
        H = parityCheckMatrix(V, Zc);
        d_2_176 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_176);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_352params(Zc)
    persistent d_2_352
    infoLen = 10*Zc;
    if isempty(d_2_352)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S6');
        V = bgs.BG2S6;
        H = parityCheckMatrix(V, Zc);
        d_2_352 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_352);
end

% For Base graph 2, Set 7
function [rows, cols, NGrp, grplist, infoLen] = d_2_13params(Zc)
    persistent d_2_13
    infoLen = 10*Zc;
    if isempty(d_2_13)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S7');
        V = bgs.BG2S7;
        H = parityCheckMatrix(V, Zc);
        d_2_13 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_13);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_26params(Zc)
    persistent d_2_26
    infoLen = 10*Zc;
    if isempty(d_2_26)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S7');
        V = bgs.BG2S7;
        H = parityCheckMatrix(V, Zc);
        d_2_26 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_26);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_52params(Zc)
    persistent d_2_52
    infoLen = 10*Zc;
    if isempty(d_2_52)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S7');
        V = bgs.BG2S7;
        H = parityCheckMatrix(V, Zc);
        d_2_52 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_52);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_104params(Zc)
    persistent d_2_104
    infoLen = 10*Zc;
    if isempty(d_2_104)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S7');
        V = bgs.BG2S7;
        H = parityCheckMatrix(V, Zc);
        d_2_104 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_104);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_208params(Zc)
    persistent d_2_208
    infoLen = 10*Zc;
    if isempty(d_2_208)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S7');
        V = bgs.BG2S7;
        H = parityCheckMatrix(V, Zc);
        d_2_208 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_208);
end

% For Base graph 2, Set 8
function [rows, cols, NGrp, grplist, infoLen] = d_2_15params(Zc)
    persistent d_2_15
    infoLen = 10*Zc;
    if isempty(d_2_15)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S8');
        V = bgs.BG2S8;
        H = parityCheckMatrix(V, Zc);
        d_2_15 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_15);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_30params(Zc)
    persistent d_2_30
    infoLen = 10*Zc;
    if isempty(d_2_30)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S8');
        V = bgs.BG2S8;
        H = parityCheckMatrix(V, Zc);
        d_2_30 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_30);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_60params(Zc)
    persistent d_2_60
    infoLen = 10*Zc;
    if isempty(d_2_60)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S8');
        V = bgs.BG2S8;
        H = parityCheckMatrix(V, Zc);
        d_2_60 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_60);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_120params(Zc)
    persistent d_2_120
    infoLen = 10*Zc;
    if isempty(d_2_120)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S8');
        V = bgs.BG2S8;
        H = parityCheckMatrix(V, Zc);
        d_2_120 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_120);
end

function [rows, cols, NGrp, grplist, infoLen] = d_2_240params(Zc)
    persistent d_2_240
    infoLen = 10*Zc;
    if isempty(d_2_240)
        bgs = coder.load('nr5g/internal/ldpc/baseGraph', 'BG2S8');
        V = bgs.BG2S8;
        H = parityCheckMatrix(V, Zc);
        d_2_240 = init(H);
    end
    [rows, cols, NGrp, grplist] = getparams(d_2_240);
end

%%
function H = parityCheckMatrix(V,Z)
%parityCheckMatrix LDPC Parity Check Matrix

    % Get shift values matrix
    P = nr5g.internal.ldpc.calcShiftValues(V,Z);

    % Lifting: apply the shift values P for each ZxZ sub-matrix
    % When the element of P is -1, the lifted sub-matrix is zero matrix.
    [numRows,numCols] = size(P);
    H = zeros(int32(numRows*Z),int32(numCols*Z),'int8');
    for i = 1:numRows
        for j = 1:numCols
            H(((i-1)*Z+1):i*Z,((j-1)*Z+1):j*Z) = buildSubBlock(Z,P(i,j));
        end
    end
    
end

function M = buildSubBlock(s,shift)

    s = int32(s);
    if shift == -1
        M = zeros(s,'int8');
    else
        M = eye(s,'int8');
        if shift > 0
            shift = shift - 1;
            M(:) = M(:,[end-shift:end 1:(end-shift-1)]);
        end
    end
    
end

function d = init(H)
    [rows, cols] = find(H);
    j = [sum(H,1) -1];
    x = find(j(2:end)-j(1:end-1));
    y = j(x);
    dlist = reshape([filter([1 -1],1,x);y],1,[]);
    NGrp = length(dlist)/2;
    grplist = reshape(dlist, 2, []);
    d.rows = rows;       % row indices of nonzero entry in H
    d.cols = cols;       % column indices of nonzero entry in H
    d.NGrp = NGrp;       % Number of groups in H
    d.grplist = grplist; % Each group has the same number of ones in each column
end

function [rows, cols, NGrp, grplist] = getparams(d)
    rows = d.rows;
    cols = d.cols;
    NGrp = d.NGrp;
    grplist = d.grplist;
end

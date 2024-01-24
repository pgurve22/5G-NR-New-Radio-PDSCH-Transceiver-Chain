function P = calcShiftValues(V,Z)
%calcShiftValues Calculate shift values from V for a lifting size Z
%
%   Note: This is an internal undocumented function and its API and/or
%   functionality may change in subsequent releases.
%
%   See also nrLDPCEncode, nrLDPCDecode.

%   Copyright 2018 The MathWorks, Inc.

%#codegen 

% The element of matrix P in the following is P(i,j) in TS 38.212 5.3.2
% when V(i,j) are defined in Table 5.3.2-2 or Table 5.3.2-3. If not
% defined, the elements are -1.

    P = zeros(size(V));
    for i = 1:size(V,1)
        for j = 1:size(V,2)
            if V(i,j) == -1
                P(i,j) = -1;
            else
                P(i,j) = mod(V(i,j),Z);
            end
        end
    end
    
end
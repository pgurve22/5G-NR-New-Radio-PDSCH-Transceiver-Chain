function out = parseOptions(fnname,options,varargin)
%parseOptions parse options from a space-separated options string
%
%   Note: This is an internal undocumented function and its API and/or
%   functionality may change in subsequent releases.
%
%   OUT = parseOptions(FNNAME,OPTIONS,NAME,VALUE,...) parses NAME,VALUE
%   pair options for the function FNNAME, where FNNAME is the calling
%   function name and OPTIONS is the set of option names to be parsed.
%   Supported NAME,VALUE pairs are:
%   
%   'OutputDataType'   - 'double' for double precision (default) 
%                        'single' for single precision
%
%   'IndexStyle'       - 'index' for linear indices (default)
%                        'subscript' for [subcarrier, symbol, antenna] 
%                         subscript row form
%
%   'IndexBase'        - '1based' for 1-based indices (default) 
%                        '0based' for 0-based indices
%
%   'MappingType'      - 'binary' to map true to  1, false to 0 (default) 
%                        'signed' to map true to -1, false to 1
%
%   'DecisionType'     - 'soft' for soft-decision demodulation/decoding (default)
%                        'hard' for hard-decision demodulation/decoding
%                         Note: for nrLDPCDecode, the default is 'hard'
%
%   'ExtractionMethod' - 'allplanes' (default) or 'direct'
%
%   'OutputFormat'     - 'info' for information part output (default)
%                        'whole' for whole codeword output
%
%   'Termination'      - 'early' for decoding termination when 
%                        parity-checks are satisfied (default)
%                        'max' for decoding termination after maximum 
%                        iterations

%   Copyright 2018 The MathWorks, Inc.

    persistent optionParser;
    persistent optionDef;
    
    if (isempty(optionParser))
        
        % Option definitions, default first
        optionDef.OutputDataType = ["double" "single"];
        optionDef.IndexBase = ["1based" "0based"];
        optionDef.IndexStyle = ["index" "subscript"];
        optionDef.MappingType = ["binary" "signed"];
        optionDef.DecisionType = ["soft" "hard"];
        optionDef.ExtractionMethod = ["allplanes" "direct"];
        optionDef.OutputFormat = ["info" "whole"];
        optionDef.Termination = ["early" "max"];
        
        % Build optionParser
        optionParser = inputParser;
        for p = string(fields(optionDef).')
            optionParser.addParameter(p,optionDef.(p)(1), ...
                @(x)validateOption(p,optionDef.(p),x));
        end
        
    end
    
    % If the input is a structure, assume it contains options already
    % parsed and return immediately
    if (nargin==3 && isstruct(varargin{1}))
        out = varargin{1};
        return;
    end
    
    % Perform parsing
    optionParser.FunctionName = fnname;
    parse(optionParser,varargin{:});

    % Validate that only the options relevant for this function were
    % specified at the input (this check is only applied if the input
    % contains options not yet parsed)
    if (nargin>2)
        specified = setdiff(optionParser.Parameters, ...
            optionParser.UsingDefaults);
        overspecified = setdiff(specified,options);
        if (~isempty(overspecified))
            coder.internal.error( ...
                'nr5g:parseOptions:UnmatchedParameter', ...
                overspecified{1},fnname,strjoin(options,', '));
        end
    end
    
    % For nrLDPCDecode, set the default to 'hard' if using the default
    results = optionParser.Results;
    if (strcmp(fnname,'nrLDPCDecode') && ...
        any(strcmp(optionParser.UsingDefaults,'DecisionType')))
        results.DecisionType = "hard";
    end
    
    % Output results structure for requested options
    out = struct();
    for i = 1:numel(options)
        option = options{i};
        values = optionDef.(option);
        out.(option) = char(values(startsWith(values,results.(option), ...
            'IgnoreCase',true)));
    end

end

function v = validateOption(name,validstr,in)

    validateattributes(in,{'char' 'string'},{},'',name);
    validatestring(in,validstr,'',name);
    v = true;

end

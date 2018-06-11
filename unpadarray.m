%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%UNPADARRAY crops data from the borders of an array
%%function B = unpadarray(A, unpadsize, direction)
%%
%%INPUT:
%%  A - array of any dimension
%%  unpadsize - vector of nonnegative integers
%%  direction - 'pre', 'post', or 'both' (the default)
%%
%%OUTPUT:
%%  B - unpadded or cropped array
%%
%%EXAMPLES:
%%  A = reshape(1:1000, [10 10 10]);
%%  B = unpadarray(A, 2, 'pre');
%%  B = unpadarray(A, [0 2 3], 'both');
%%  B = unpadarray(A, [0 2 3]); % same
%%  B = unpadarray(A, 0); % unchanged
%%  B = unpadarray(A); % unchanged
%%  B = unpadarray(A, 11, 'pre'); % empty array
%%  B = unpadarray(A, 1.5); % error
%%  B = unpadarray(A, -1); % error
%%  B = unpadarray(A, [1 1 1 1]); % error for 3d array
%%
%%DESCRIPTION:
%%  UNPADARRAY does the opposite of builtin PADARRAY.  It unpads an 
%%  array like PADARRAY pads them.  See the help in PADARRAY for more 
%%  information.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A = unpadarray(A, unpadsize, direction)

narginchk(1,3);

if nargin<3
    direction = 'both';
end

if nargin<2
    return;
end

unpadsize = unpadsize(:);
if any(unpadsize<0)
    error('unpadsize needs to be a vector of non-negative integers.');
end

numdims = numel(unpadsize);
asize = size(A);
adims = length(asize);

if numdims>adims
    error('unpadarray::Number of unpad dimensions exceeds array.');
end

if numdims<adims
    unpadsize(adims) = 0;
end

idx = cell(adims,1);
for k = 1:adims
    
    M = asize(k);
    p = unpadsize(k);
    
    if p~=0  
        switch direction
            case 'pre'
                idx{k} = 1+p:M;
            case 'post'
                idx{k} = 1:M-p;
            case 'both'
                idx{k} = 1+p:M-p;
            otherwise
                error('unpadarray::Directions are pre, post, or both.');
        end
    else
        idx{k} = ':';
    end
end

S.type = '()';
S.subs = idx;
%S = struct('type', '()', 'subs', idx);
A = subsref(A, S);
%A = A(idx{:});
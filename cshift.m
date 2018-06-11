%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%CSHIFT Shifts positions of elements circularly
%%function B = cshift(A, L)
%%
%%INPUT:
%%  A - array of any dimension
%%  L - vector of integer shifts
%%
%%OUTPUT:
%%  B - shifted array
%%
%%EXAMPLES:
%%  A = reshape(1:64, [8 8]);
%%  B = cshift(A, 4);
%%  B = cshift(A, -4);
%%  B = cshift(A, 12);
%%  B = cshift(A, [0 4]);
%%  B = cshift(A, 0); % unchanged
%%  B = cshift(A, 8); % unchanged for this array
%%  B = cshift(A); % unchanged
%%  B = cshift(A, 1.5); % error
%%  B = cshift(A, [1 1 1]); % error for 2d array
%%
%%DESCRIPTION:
%%  CSHIFT is an analogue of CIRCSHIFT in builtin Matlab.  The input 
%%  structure is different.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A = cshift(A, L)

narginchk(1,2);

if nargin<2
    return;
end

L = L(:);
ldims = numel(L);
asize = size(A);
adims = length(asize);

if ldims>adims
    error('cshift::Number of L dimensions exceeds array.');
end

if ldims<adims
    L(adims) = 0;
end

idx = cell(adims,1);
for k = 1:adims
    
    M = asize(k);
    p = L(k);
    
    if p~=0
%        idx{k} = mod((1:M) - (p+1), M) + 1; % Account for matlab offset
        idx{k} = mod(-p:M-p-1, M) + 1;
    else
        idx{k} = ':';
    end
end

S.type = '()';
S.subs = idx;
%S = struct('type', '()', 'subs', idx);
A = subsref(A, S);
%A = A(idx{:});
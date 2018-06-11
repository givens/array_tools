%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%VEC vectorize array
%%function B = vec(A, K)
%%
%%INPUT:
%%  A - array of any dimension
%%  K - vector dimension (default 1 for column)
%%
%%OUTPUT:
%%  B - vectorized array
%%
%%EXAMPLES:
%%  A = (1:4);
%%  B = vec(A); % column
%%  B = vec(A, 1); % column (redundant)
%%  B = vec(A, 2); % row
%%  B = vec(A, 3); % vector in 3rd dimension
%%  B = vec(A, 0); % error
%%  B = vec(A, -1); % error
%%  B = vec(A, 1.5); % error
%%
%%DESCRIPTION:
%%  This function makes an array a vector.  It is sometimes useful to
%%  make the vector a column, row, or another dimension.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A = vec(A, K)

narginchk(1,2);

if nargin<2
    K = 1;
end

if K<1
    error('vec::Use a positive integer for K.');
end

A = A(:);
A = shiftdim(A, 1-K);

end


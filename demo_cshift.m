%% CSHIFT DEMO

%% Create matrix
A = reshape(1:64, [8 8]);
disp(A);

%% Shift row
disp(cshift(A, 1));

%% Shift in other direction
disp(cshift(A, -1));

%% Shift columns
disp(cshift(A, [0 3]));

%% Test against builtin fftshift
B = cshift(A, [4 4]);
C = fftshift(A);
assert(isequal(B, C), ...
    'fftshift test - assertion failed');

%% Test against builtin circshift
B = cshift(A, [0 -2]);
C = circshift(A, -2, 2);
assert(isequal(B, C), ...
    'circshift test - assertion failed');

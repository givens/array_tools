%% VEC DEMO

%% Create matrix
A = reshape(1:4, [2 2]);
disp(A);

%% Make column vector
c = vec(A);
disp(c);

%% Make row vector
r = vec(A,2);
disp(r);

%% Make 3rd dimension vector "frame"
f = vec(A,3);
disp(f);

%% 3d outer product
%d = c*r*f; % TODO
d = bsxfun(@times, c*r, f); 
disp(d);

%% Test against reshape for column
cc = reshape(1:4, [4 1]);
assert(isequal(c, cc), ...
    'col reshape test - assertion failed');

%% Test against reshape for frame
ff = reshape(1:4, [1 1 4]);
assert(isequal(f, ff), ...
    'frame reshape test - assertion failed');

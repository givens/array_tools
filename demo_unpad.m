%% UNPADARRAY DEMO

%% Create A matrix
A = reshape(1:64, [8 8]);
disp(A);

%% Remove first row
disp(unpadarray(A, 1, 'pre')); % Removes first row

%% Remove 3 columns from both sides
disp(unpadarray(A, [0 3])); 

%% Removes last elements for both dimensions
disp(unpadarray(A, [1 1], 'post'));
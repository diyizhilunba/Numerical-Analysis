%% Problem 1d
addpath functions\
n = 100; % size of the matrix
A = tril(-ones(n)) + 2*eye(n);
A(:,end) = 1; % set up the matrix
A(:,end) = A(:,end) + 1e-15 * randn(n,1); % add some error

% Set up b and calculate x
xtrue = randn(n,1);
b = A * xtrue;
x = gausselim(A,b);

% calculate the error
% relative error:
rel_err = norm(x-xtrue)/norm(xtrue);
disp("relative error:")
disp(rel_err);
% relative residual error:
rel_res = norm(A*x-b)/norm(b);
disp("relative residue error:")
disp(rel_res);
% condition number
cond_num = cond(A);
% The usual error bound
disp("Conditional Number x eps")
disp(cond_num*eps);
% Since now it is not backward stable, the relative residue may be bigger
% than epsilon
disp("Error bound")
disp(cond_num * rel_res);

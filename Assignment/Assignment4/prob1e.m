warning('off', 'MATLAB:nearlySingularMatrix');
% generate random Q
X = rand(n);
[Q,R] = qr(X);
if(Q(1,1) < 0)
    Q = -Q;
end

% A
A = Q * lamda_mat * Q';

lamda0 = 51/1000;
addpath functions\

% Inverse Iteration

% find largest e-value for 
w = rand(n,1);
[evec,eval, xiter, err_iter] = rqi(A, w, lamda0, Q(:,20), 10^-12);

disp(eval)
disp(max(xiter));

[evec,eval, xiter, err_iter] = inverse_iteration(A, w, lamda0, Q(:,20), 10^-12);
disp(max(xiter));
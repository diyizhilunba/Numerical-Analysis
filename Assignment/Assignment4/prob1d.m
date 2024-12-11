% Lamda
n = 100;
k_iter = 1:n;
true_eig = (1./k_iter)';
lamda_mat = diag(true_eig);

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
[evec,eval, xiter, err_iter] = inverse_iteration(A, w, lamda0, Q(:,20), 10^-12);
semilogy(1:xiter,err_iter,'bo',1:xiter, 3*(abs(1/20-51/1000)/abs(1/19-51/1000)).^(1:xiter),'r-');
legend("Actual error","estimation")
title("plot1d of actual error vs esitmation")
disp(max(xiter))
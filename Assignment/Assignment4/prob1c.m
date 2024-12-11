% Lamda
n = 100;
k_iter = 1:n;
true_eig = (1./k_iter)';
lamda_mat = diag(true_eig);

% generate random Q
B = rand(n);
[Q,R] = qr(B);
if(Q(1,1) < 0)
    Q = -Q;
end

% A
A = Q * lamda_mat * Q';

% Use power method to find the eignpair
addpath functions\
w = rand(n,1);
[evec1,eval1, xiter,err_iter] = pow_method(A,w,Q(:,1),10^-12);
what = w - evec1' * evec1 * w;
[evec, eval, xiter, err_iter] = pow_method_deflation(A,what,evec1, Q(:,2),10^-12);
disp(eval)
semilogy(1:xiter,err_iter,'bo',1:xiter, (2/3).^(1:xiter),'r-');
legend("Actual error","estimation")
title("plot1c of actual error vs esitmation")
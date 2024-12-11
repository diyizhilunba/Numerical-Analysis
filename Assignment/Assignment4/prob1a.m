% Lamda
k_iter = 1:100;
true_eig = (1./k_iter)';
lamda_mat = diag(true_eig);

% generate random Q
B = rand(100,100);
[Q,R] = qr(B);

% A
A = Q * lamda_mat * Q';
cal_eig = sort(eig(A),"descend");
disp("The maximum absolute error is:")
disp(max(abs(cal_eig-true_eig)))


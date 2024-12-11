warning('off', 'MATLAB:nearlySingularMatrix');
% generate random Q
X = rand(n);
[Q,R] = qr(X);
if(Q(1,1) < 0)
    Q = -Q;
end

% A
A = Q * lamda_mat * Q';
tol = 1e-12;
max_iter = 100;

addpath functions\
[eval,evec] = rqi_deflation(A, tol, max_iter);

% Compute the true eigenvalues using MATLAB's eig function
e = eig(A);

% Sort both computed and true eigenvalues for comparison
eval_sorted = sort(eval);
e_sorted = sort(e);

% Calculate the absolute error between computed and true eigenvalues
absolute_errors = abs(e_val_sorted - e_sorted);

% Plot the absolute error
figure;
plot(1:n, absolute_errors, '.-');
xlabel('E-val Index');
ylabel('Absolute Error');
grid on;

% Display results
fprintf('Maximum absolute error: %.10e\n', max(absolute_errors));
fprintf('Mean absolute error: %.10e\n', mean(absolute_errors));

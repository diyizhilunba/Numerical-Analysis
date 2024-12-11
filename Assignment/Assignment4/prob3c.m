% Parameters
n = 100;          % Number of interior points
h = 1 / (n + 1);  % Step size

% Construct the tridiagonal matrix A
main_diag = 2 * ones(n, 1);
off_diag = -1 * ones(n-1, 1);
A = (1 / h^2) * (diag(main_diag) + diag(off_diag, 1) + diag(off_diag, -1));

% Solve the eigenvalue problem
[eig_vectors, eig_values] = eig(A);

% Extract the first three eigenvalues (smallest)
lambda1 = eig_values(1,1);
lambda2 = eig_values(2,2);
lambda3 = eig_values(3,3);

% Extract the first three eigenfunctions (corresponding columns in eig_vectors)
u1 = eig_vectors(:, 1);
u2 = eig_vectors(:, 2);
u3 = eig_vectors(:, 3);

% Create x values for plotting (excluding boundary points)
x = linspace(h, 1-h, n);

% Plot the first three eigenfunctions
figure;
plot(x, u1, '.-', x, u2, '.-', x, u3, '.-');
legend('$u_1(x)$', '$u_2(x)$', '$u_3(x)$', 'Interpreter', 'latex');
xlabel('x');
ylabel('$u(x)$', 'Interpreter', 'latex');

% Plot the probability densities |u(x)|^2 for each eigenfunction
figure;
plot(x, u1.^2, '.-', x, u2.^2, '.-', x, u3.^2, '.-');
legend('$|u_1(x)|^2$', '$|u_2(x)|^2$', '$|u_3(x)|^2$', 'Interpreter', 'latex');
xlabel('x');
ylabel('$|u(x)|^2$', 'Interpreter', 'latex');

% Display the eigenvalues (energy levels)
fprintf('First three e-val:\n');
fprintf('lambda1 = %.5f\n', lambda1);
fprintf('lambda2 = %.5f\n', lambda2);
fprintf('lambda3 = %.5f\n', lambda3);
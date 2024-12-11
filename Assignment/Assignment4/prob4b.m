% Two random symmetric positive-definite matrices 
n = 1000;

% Function to generate random symmetric positive-definite matrix with specific eigenvalue range
function A = generate_spd_matrix(n, min_eig, max_eig)
    
    evals = min_eig + (max_eig - min_eig) * rand(n, 1);
    B = rand(n);
    [D,~] = qr(B);
    Q = orth(randn(n));
    
    A = Q * D * Q';
    
    % Ensure matrix is symmetric 
    A = (A + A') / 2;
end


A1 = generate_spd_matrix(n, 1, 4);
A2 = generate_spd_matrix(n, 1, 100);

% b
b = rand(n, 1);
b = b / norm(b);

% Initial guess
x0 = zeros(n, 1);

% Set parameters
tol = 1e-12;
max_iter = 1000;

% Run conjugate gradient method for both matrices
[x1, err_vec1] = mycg(A1, b, x0, tol, max_iter);
[x2, err_vec2] = mycg(A2, b, x0, tol, max_iter);

% Calculate theoretical convergence rates
kappa1 = 4 / 1;      % condition number for A1
kappa2 = 100 / 1;    % condition number for A2

iterations = 1:length(err_vec1);
theory1 = sqrt(b' * A1 * b) * ((sqrt(kappa1) - 1) / (sqrt(kappa1) + 1)) .^ iterations;

iterations2 = 1:length(err_vec2);
theory2 = sqrt(b' * A2 * b) * ((sqrt(kappa2) - 1) / (sqrt(kappa2) + 1)) .^ iterations2;

% Plot results with distinct colors
figure;
semilogy(iterations, err_vec1, 'b-', 'DisplayName', 'Actual (A1)');      % Blue solid line
hold on;
semilogy(iterations, theory1, 'g--', 'LineWidth', 1.5, 'DisplayName', 'Theoretical (A1)');  % Green dashed line
semilogy(iterations2, err_vec2, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Actual (A2)');      % Red solid line
semilogy(iterations2, theory2, 'c--', 'LineWidth', 1.5, 'DisplayName', 'Theoretical (A2)'); % Yellow dashed line
xlabel('Iteration');
ylabel('Residual Norm (log scale)');
title('Conjugate Gradient Convergence');
legend('show');
grid on;
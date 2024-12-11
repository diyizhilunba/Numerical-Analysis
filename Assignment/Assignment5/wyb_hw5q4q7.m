addpath functions\
% Define parameters
n = 40; % Number of Chebyshev nodes
f = @(x) exp(-10*x.^2); % Function to integrate

% Compute Chebyshev nodes
x_cheb = cos((2*(0:n-1)' + 1) * pi / (2 * n)); % Chebyshev nodes

% Evaluate the function at Chebyshev nodes
f_values = f(x_cheb);

% Compute the Chebyshev spectral indefinite integration matrix
S_vv = wyb_chebint(n);

% Compute the approximated integral at Chebyshev nodes
integral_approx = S_vv * f_values;

% Compute the analytical integral
exact_integral = @(x) (sqrt(pi) / (2 * sqrt(10))) * (erf(sqrt(10) * x) - erf(-sqrt(10)));
integral_exact = exact_integral(x_cheb);

% Plot the approximated and exact integrals
figure;
subplot(2, 1, 1);
plot(x_cheb, integral_exact, 'b-', 'LineWidth', 3, 'DisplayName', 'Exact Integral');
hold on;
plot(x_cheb, integral_approx, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Approximated Integral');
xlabel('x');
ylabel('Integral Value');
title('Integral of f(x) = exp(-10x^2)');
legend('show');
grid on;

% Compute and plot the absolute error
subplot(2, 1, 2);
error = abs(integral_exact - integral_approx);
semilogy(x_cheb, error, 'b.-', 'LineWidth', 3, 'DisplayName', 'Absolute Error');
xlabel('x');
ylabel('Error');
title('Absolute Error of Integral Approximation');
legend('show');
grid on;
addpath functions\
% Parameters
n = 15; % Number of panels
p = 16; % Number of Chebyshev nodes per panel
dense_grid = linspace(0, 1, 10000); % Dense grid for error analysis

% Define functions
f1 = @(x) exp(-x);
f2 = @(x) exp(-10000 * x);

% Generate Chebyshev nodes and function values
nodes = adapcheb_nodes(n, p); % Adaptive Chebyshev nodes
matrix_f1 = f1(nodes); % Function values for f1 at the nodes
matrix_f2 = f2(nodes); % Function values for f2 at the nodes

% Piecewise Interpolation for f1 and f2
interp_f1 = arrayfun(@(x) adapcheb_interp(n, p, matrix_f1, x), dense_grid);
interp_f2 = arrayfun(@(x) adapcheb_interp(n, p, matrix_f2, x), dense_grid);

% Global Interpolation
total_nodes = n * p; % Total number of nodes
global_nodes = cos((2 * (0:total_nodes-1) + 1) * pi / (2 * total_nodes)); % Global Chebyshev nodes in [-1, 1]
global_nodes = 0.5 * (global_nodes + 1); % Scale to [0, 1]
global_weights = (-1).^(0:total_nodes-1)' .* sin((2*(0:total_nodes-1)' + 1) * pi / (2 * total_nodes));
global_f1_values = f1(global_nodes);
global_f2_values = f2(global_nodes);
global_interp_f1 = arrayfun(@(x) baryinterp(x, global_nodes, global_f1_values, global_weights), dense_grid);
global_interp_f2 = arrayfun(@(x) baryinterp(x, global_nodes, global_f2_values, global_weights), dense_grid);

% Errors
error_piecewise_f1 = abs(f1(dense_grid) - interp_f1);
error_piecewise_f2 = abs(f2(dense_grid) - interp_f2);
error_global_f1 = abs(f1(dense_grid) - global_interp_f1);
error_global_f2 = abs(f2(dense_grid) - global_interp_f2);

% Plot 1: Functions and Piecewise Interpolants
figure;
plot(dense_grid, f1(dense_grid), 'k-', 'DisplayName', 'f1(x) = e^{-x}');
hold on;
plot(dense_grid, f2(dense_grid), 'b-', 'DisplayName', 'f2(x) = e^{-10000x}');
plot(dense_grid, interp_f1, 'r--', 'DisplayName', 'Piecewise Interpolant f1');
plot(dense_grid, interp_f2, 'g--', 'DisplayName', 'Piecewise Interpolant f2');
hold off;
title('Functions and Piecewise Interpolants');
legend('Location', 'best');
xlabel('x');
ylabel('f(x)');
grid on;

% Plot 2: Absolute Error for Piecewise Interpolants
figure;
loglog(dense_grid, error_piecewise_f1, 'r-', 'DisplayName', 'Piecewise Error f1');
hold on;
loglog(dense_grid, error_piecewise_f2, 'g-', 'DisplayName', 'Piecewise Error f2');
hold off;
title('Piecewise Interpolant Absolute Error');
legend('Location', 'best');
xlabel('x');
ylabel('Error');
grid on;

% Plot 3: Comparison of Piecewise and Global Interpolation Errors
figure;
loglog(dense_grid, error_global_f1, 'r--', 'DisplayName', 'Global Error f1');
hold on;
loglog(dense_grid, error_global_f2, 'g--', 'DisplayName', 'Global Error f2');
loglog(dense_grid, error_piecewise_f1, 'k-', 'DisplayName', 'Piecewise Error f1');
loglog(dense_grid, error_piecewise_f2, 'b-', 'DisplayName', 'Piecewise Error f2');
hold off;
title('Comparison of Piecewise and Global Errors');
legend('Location', 'best');
xlabel('x');
ylabel('Error');
grid on;

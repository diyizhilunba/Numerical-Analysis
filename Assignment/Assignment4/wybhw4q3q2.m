% Parameters
n = 100;          % Number of grid points
h = 1 / (n + 1);  % Grid spacing
x = linspace(0, 1, n+2);  % Grid points including boundary points

% Gaussian charge density parameters
mu = 0.5;
sigma = 0.05;
q = (1 / (sigma * sqrt(2 * pi))) * exp(-(x(2:end-1) - mu).^2 / (2 * sigma^2));  % q(x_i) for interior points

% Construct the tridiagonal matrix A
main_diag = 2 * ones(n, 1);
off_diag = -1 * ones(n-1, 1);
A = (1 / h^2) * (diag(main_diag) + diag(off_diag, 1) + diag(off_diag, -1));

% Right-hand side vector b
b = h^2 * q';

% Solve for u (interior points only)
u_interior = A \ b;

% Add boundary conditions
u = [0; u_interior; 0];  % Full solution vector with boundary values

% Plot the solution
figure;
plot(x, u, 'b.-');
xlabel('x');
ylabel('u(x)');
grid on;

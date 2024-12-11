% Parameters
n = 100;         
h = 1 / (n + 1); 
x = linspace(0, 1, n+2);  

% Gaussian
sigma = 0.05;
mu = 0.5;
q = (1 / (sigma * sqrt(2 * pi))) * exp(-(x(2:end-1) - mu).^2 / (2 * sigma^2));

% Construct Ax=b
A = (1 / h^2) * (diag(2*ones(n,1)) + diag(-1 * ones(n-1, 1), 1) + diag(-1 * ones(n-1, 1), -1));
b = h^2 * q';

% Solve for u (interior points only)
u_interior = A \ b;

% Add boundary conditions
u = [0; u_interior; 0];  

% Plot the solution
figure;
plot(x, u, 'bo');
xlabel('x');
ylabel('u(x)');


% Analysis of f(x) = sin(αx) for different α values

% Parameters
alphas = [10, 50, 100];  % α values
n_values = 5:5:150;      % Number of interpolation points
x_plot = linspace(-1, 1, 1000);  % Dense evaluation grid
errors = zeros(length(n_values), length(alphas));

% Compute errors for each α and n
for k = 1:length(alphas)
    alpha = alphas(k);
    f = @(x) sin(alpha.*x);
    
    for i = 1:length(n_values)
        n = n_values(i);
        
        % Compute Chebyshev nodes
        x_cheb = cos((2*(0:n-1)'+1)/(2*n)*pi);
        y_cheb = f(x_cheb);
        
        % Compute barycentric weights as specified
        wc = (-1).^(0:n-1)'.*sin((2*(0:n-1)'+1)/(2*n)*pi);
        
        % Evaluate interpolant
        y_exact = f(x_plot);
        y_interp = zeros(size(x_plot));
        for j = 1:length(x_plot)
            y_interp(j) = baryinterp(x_plot(j), x_cheb, y_cheb, wc);
        end
        
        % Compute maximum error
        errors(i,k) = max(abs(y_exact - y_interp));
    end
end

% Plot results
figure('Position', [100, 100, 800, 500]);
semilogy(n_values, errors, '-o', 'LineWidth', 2, 'MarkerSize', 6);
title('Convergence for f(x) = sin(αx)', 'FontSize', 14);
xlabel('n', 'FontSize', 12);
ylabel('Maximum Absolute Error', 'FontSize', 12);
legend(sprintf('α = %d', alphas(1)), ...
       sprintf('α = %d', alphas(2)), ...
       sprintf('α = %d', alphas(3)), ...
       'Location', 'southwest', 'FontSize', 12);
grid on;
set(gca, 'FontSize', 12);

% Add vertical lines at n ≈ α
hold on;
for k = 1:length(alphas)
    xline(alphas(k), '--', sprintf('n = %d', alphas(k)), 'HandleVisibility', 'off');
end

% Print information about error behavior near n ≈ α
for k = 1:length(alphas)
    alpha = alphas(k);
    idx = find(n_values >= alpha, 1);
    if ~isempty(idx)
        fprintf('\nFor α = %d:\n', alpha);
        fprintf('Error at n ≈ α: %.2e\n', errors(idx,k));
        if idx > 1
            fprintf('Error change at n ≈ α: %.2e → %.2e\n', ...
                errors(idx-1,k), errors(idx,k));
        end
    end
end
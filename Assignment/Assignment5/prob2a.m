% Prob 2a
% Define range of n
n_values = 2:40;
cond_nums = zeros(size(n_values));

% Loop over n values
for k = 1:length(n_values)
    n = n_values(k);
    
    % Generate equispaced nodes on [-1, 1]
    x = linspace(-1, 1, n)';
    
    % Generate Vandermonde matrix for monomials
    V = zeros(n);
    for j = 1:n
        V(:,j) = x.^(j-1);  % Powers from 0 to n-1
    end
    
    % Compute condition number
    cond_nums(k) = cond(V);
end

% Create plot
figure;
semilogy(n_values, cond_nums, '-o', 'LineWidth', 1.5, 'MarkerSize', 6);
xlabel('n');
ylabel('Condition Number');
title("Conditional Number of Vandermonde matrix")
grid on;
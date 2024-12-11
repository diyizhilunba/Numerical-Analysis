n = [10, 500, 1000];
cond_nums = zeros(1, 3);

chebyshev_poly = @(k, x) cos(k * acos(x)); 

for i = 1:3
    number = n(i);
    xc = cos((2*(0:number-1)' + 1) / (2*number) * pi);
    
    % Construct the Chebyshev matrix
    T = zeros(number);
    for j = 1:number
        T(:, j) = chebyshev_poly(j-1, xc); % Evaluate T_{j-1}(x)
    end
    
    % Compute condition number
    cond_nums(i) = cond(T);
end

% Display the condition numbers
fprintf('The condition numbers for 10, 500, and 1000 nodes are: %.5f, %.5f, %.5f\n', ...
        cond_nums(1), cond_nums(2), cond_nums(3));

%%
ans = 2*pi*besseli(0,1); % Correct integral computation
N = 40; % Maximum number of nodes
a = -pi;
b = pi;
f = @(x) exp(cos(x));

err = zeros(1, N-2); % Adjust error array size
% Left-hand rule approximation
for n = 3:N
    h = (b-a)/n;
    x = a + (0:n-1) * h;
    res = h * sum(f(x));
    err(n-2) = abs(res - ans);
end
fig2 = figure;
semilogy(3:N, err); % Correct plotting range
xlabel('Number of nodes');
ylabel('Error');
title('Error in Left-Hand Rule Integration');

                          

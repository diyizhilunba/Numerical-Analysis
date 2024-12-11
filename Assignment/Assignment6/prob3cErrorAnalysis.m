%
f = @(x)sin(x);
df = @(x)cos(x);
function Df = df_est(f1,x,h)
    Df = 4/(6*h)*(f1(x+h)-f1(x-h)) - 1/(12*h) * (f1(x+2*h)-f1(x-2*h));
end
x = 0.1;
actual_ans = df(x);
n = 100;
h_values = logspace(-11, -1, n);  % Step sizes
res = zeros(1, n);                 % Array to store derivative estimates
err = zeros(1, n);                 % Array to store errors
err_est1 = 10^-2*eps./h_values;
err_est2 = 10^-2 *h_values.^4;
% Loop over step sizes
for i = 1:n
    h = h_values(i);               % Current step size
    res(i) = df_est(f, x, h);      % Compute estimated derivative
    err(i) = abs(actual_ans - res(i));  % Compute absolute error
end
figure;
loglog(h_values, err, '-', 'DisplayName', 'Actual Error');        % Actual error
hold on;
loglog(h_values, err_est1, '--', 'DisplayName', '\epsilon_M/h'); % Machine epsilon divided by h
loglog(h_values, err_est2, '--', 'DisplayName', 'O(h^4)');             % O(h^4) error term
xlabel('Step size (h)');
ylabel('Error');
title('Error in Finite Difference Derivative Approximation');
legend('Location', 'best');


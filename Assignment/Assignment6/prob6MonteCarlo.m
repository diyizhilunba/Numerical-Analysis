% Parameters
f = @(x) exp(-x.^2);
a = -6;
b = 6;
true_val = sqrt(pi);

res = zeros(1,8);
err = zeros(1,8);
for k = 1:8
    n = 10^k;
    x = a + (b-a)*rand(n,1);
    res(k) = sum(f(x))*(b-a)/n;
    err(k) = abs(res(k)-true_val);
end

loglog(10.^(1:8),err);hold on
loglog(10.^(1:8),1./sqrt(10.^(1:8)));
legend("Absolute Error", "$$\frac{C}{\sqrt{n}}$$", 'Interpreter', 'latex');
title("Plot of Monte Carlo approximation")
xlabel(n);
ylabel("Error")

disp(err(length(err)))


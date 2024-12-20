addpath functions\

% parameters
f = @(x)exp(-x.^2);
a = -6;
b = 6;
ans = sqrt(pi);
err = zeros(1,100);
% approximate 
for n = 1:60
    [x,w] = lgwt(n,a,b);
    approx = sum((f(x) .* w));
    error = abs(ans - approx);
    err(n) = error;
    if(err(n) < 10^-12)
        disp(n)
    end
end
semilogy(1:100,err)
title("Plot of Error of estimation based on n")
xlabel("n")
ylabel("Absolute Error")


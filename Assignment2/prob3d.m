%% Question d for Problem 3
% define the parameters
% We use eps for the smallest error in double precision
f = @(x) - 4 + 3*x - 2*x.^2+x.^3;
% function to calculate derivative
x0 = 1; % the point we calculate derivative
pow = linspace(-16,0,100);
hiter = 10.^pow; % the range of h we want to plot
% calculate the corresponding result and the error
% also plot the two lines
res = zeros(length(pow));
error = zeros(length(pow));
y1 = zeros(length(pow));
y2 = zeros(length(pow));
for it = 1:length(pow)
    res(it) = (f(x0+hiter(it)) - f(x0))/hiter(it);
    error(it) = abs(res(it) - 2);
    y1(it) = hiter(it);
    y2(it) = 2 * eps * 2/hiter(it);
end

disp(error)
% plot the result
figure(1);
h1 = loglog(hiter,error,'r-');hold on;
h2 = loglog(hiter,y1,'--');hold on;
h3 = loglog(hiter, y2, 'g--'); hold off;
legend([h1(1) h2(1) h3(1)],{'Error', 'y = |f''(1)|h/2', 'y = 2\epsilon|f(1)|/h'});
title("Plot of error over h");
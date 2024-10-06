%% For the first question in hw 2
%% problem a
% define the two functions
f = @(x) exp(x) - x.^2 - 6*x - 9;
g = @(x) 2*log(x+3);
% define the range for x and the corresponding y
xiter = -3:0.01:6;
gxiter = g(xiter);
figure(1)
plot(xiter, gxiter, xiter, xiter);
title("Plot of fix points of y = g(x)");
grid on
%% probelm d
% set up the parameters
x0 = 3.5; % initial guess
xiter = x0; % the x that 
% continues iterates to find the solution
niter = 0; % record the number of iteration
while abs(f(xiter)) >= 10^-10
    xiter = g(xiter);
    niter = niter + 1;
end
fprintf("The solution is: %.10f\n", xiter);
fprintf("The number of iteration used is: %d", niter);

%% Projectile
g= 9.8
v0 = 15;
d = 10;
theta = linspace(0, pi/2,100);
f = @(theta)(v0^2/g)*sin(2*theta) - d;

figure(1);
plot(theta, f(theta),'-');

theta0 = 0;
theta_true = fzero(f,theta0)
residual = f(theta0); hold on

%Pllot solution
plot(theta_true, f(theta_true),'o'); hold off

addpath Class\'Class 2'\function\ % the file name and function name 
% needs to be the same


itermax = 30;
a = 0; 
b = pi/4;
theta = bisection(f, a, b, itermax);
disp(['Error of bisection = ', num2str(abs(theta - theta_true))])




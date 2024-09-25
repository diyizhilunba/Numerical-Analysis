%% Prepration
% set up the whiteboard
set(groot, 'defaultLineLIneWidth',2)
% add path to files
addpath MATLAB\Homework\Homework 1\functions\;
%% Problem 1
%% (a)
% set up parameters and functions
x = -1:0.01:1;
f = @(x) exp(x) - x.^2 - 0.5;

% calculate zero point
x_star = fzero(f,0.5);%

% plotting
figure(1);
plot(x,f(x),'r-');
hold on 
plot(x_star, f(x_star), 'bo');
title('Plot of f(x) = exp(x)- x.^2 - 0.5');
xlabel('x');
ylabel('f(x)');
grid on;

%% (b)
%define the function
a = -1;
b = 1;
itermax = 50; 

%get the solution
[x,xiter] = bisection(f, a, b, itermax);
fprintf("Solution for function: %f", x);

%find the error and error bound
error = abs(xiter - x);
for k = 1: itermax + 1
    err_bound(k) = (b - a)/(2.^k);
end


figure(2)
semilogy(1:itermax + 1,error,1:itermax + 1, err_bound,'--');

title("Plot of error of each trial")
xlabel('number of trials');
ylabel('error');
%% Problem 2
% add path for the functions
addpath MATLAB\Homework\Homework 1\functions\;

% set up the parameters
a = -1; % the beginning of the interval
b = 1; % end of the interval
x0 = 0; % initial guess for newton's method and the first parameter for secant method
x1 = 1; % the second parameter for secant method
f = @(x)cos(exp(x)); % function
fp = @(x) -sin(exp(x)) .* exp(x); % derivative of the function
tol = 10^(-10); % tolerance
x_star = fzero(f,0); % x_star, the actual solution

% Newton's Method
[x,niter,xiter] = newton_tol(f,fp,x0,50,tol); % get the solution and 
% all the iterative trials info by Newton's method

% show the solution
fprintf("x*: %.12f\n", x_star); % show x_star

% Newton's method
fprintf("Newton's method\n");
fprintf("x: %.12f\n", x); % show final solution by Newton's method with 12 
% digits
fprintf("niter: %d\n", niter); % the number of iteration
fprintf("xiter: %.12f\n", abs(xiter));
fprintf("error: %.12f\n", abs(xiter - fzero(f,0))); % the error in 12 digit

% Bisection method
[x,niter,xiter] = bisection_tol(f,a, b, 50, tol); % get the solution and 
% all the iterative trials info with bisection method

% show the solution of Bisection method
fprintf("Bisection method\n");
fprintf("x: %.12f\n", x); % show final solution by Bisection method with 12 
% digits
fprintf("niter: %d\n", niter); % the number of iteration
fprintf("error: %.12f\n", abs(xiter - fzero(f,0))); % the error in 12 digit
for i = 2:length(xiter)
    fprintf("difference: %.12f\n", abs(xiter(i) - xiter(i-1)));
end

% Secant Method
fprintf("Secant Method\n");
[x, niter, xiter] = secant_tol(f,x0,x1,50,10^-10);
fprintf("x: %.12f\n", x);% the final solution by Bisection method

fprintf("niter: %d\n", niter); % the number of iteration
fprintf("error: %.12f\n", abs(xiter - fzero(f,0))); % the error in 12 digit
%% Part d
fprintf("--------------Part d---------------")
num = 1:1:10;
tols = 10.^ (-1*num); % the vector of all tolerance
fprintf("tols: %d\n",tols);
bi_n = zeros(10,1);
new_n = zeros(10,1);
sec_n = zeros(10,1);
for i = 1:10
    [x1,niter1,xiter1] = bisection_tol(f,a,b,50,tols(i)); 
    bi_n(i) = niter1;

    [x2,niter2,xiter2] = newton_tol(f,fp,x0,50,tols(i)); 
    new_n(i) = niter2;

    [x3,niter3,xiter3] = secant_tol(f,x0,x1,50,tols(i)); 
    sec_n(i) = niter3;
end
fprintf("Bisection method: %d\n",bi_n);
fprintf("Newton's method: %d\n",new_n);
fprintf("Secant Method: %d\n", sec_n);

figure(3)
semilogx(tols, bi_n, tols, new_n, tols, sec_n);
title("Plot of number of iteration needed for certain error requirement")
legend("bisection method", "Newton's method",'Secant Method');
%% Problem 3
% record the data for all three methods
x_star = log(pi/2);
a = -1;
b = 1;
x0 = 0; % initial guess for newton's method and the first parameter for secant method
x1 = 1;
[~,xiter1] = bisection(f,a,b,itermax);
[~,xiter2] = newton(f,fp,x0,itermax);
[~,xiter3] = secant(f,x0,x1,itermax);
% calculate all the errors
error1 = abs(x_star - xiter1);
error2 = abs(x_star - xiter2);
error3 = abs(x_star - xiter3);
% plot the graph
figure(4)
semilogy(1:length(error1),error1); hold on
semilogy(1:length(error2), error2); hold on
semilogy(1:length(error3), error3); hold off
legend("Bisection method","Newton's Method", "Secant Method");
title("Plot of error in each trial")

%% c
% log error of bisection
error1_1 = log(error1(1:end-1));%e_{k-1}
error1_2 = log(error1(2:end));%e_{k}
% log error of newton
error2_1 = log(error2(1:end-1));%e_{k-1}
error2_2 = log(error2(2:end));%e_{k}
% log error of secant
error3_1 = log(error3(1:end-1));%e_{k-1}
error3_2 = log(error3(2:end));%e_{k}
fprintf("Quotient: %.12f\n",error3_2/error3_1);
% line of y = px
x = linspace(-40,0,1000);
y1 = x;
y2 = 2 * x;
y3 = (sqrt(5) + 1)/2 * x;

figure(5)
scatter(error1_1,error1_2, "red"); hold on;
scatter(error2_1, error2_2, "blue"); hold on;
scatter(error3_1, error3_2, "green"); hold on;
plot(x,y1,"red"); hold on;
plot(x, y2, "blue"); hold on;
plot(x, y3, "green"); hold off;

legend("Bisection method", "Newton's method", "Secant method");
legend(location = 'southeast')
title("Plot of e_k versus e_k-1")
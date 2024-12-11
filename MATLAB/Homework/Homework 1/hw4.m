% add path
addpath Homework\'Homework 1'\functions\

%% Problem 1
% parameters
a = -2; % start of the interval
b = 2; % end of the interval
step = 0.25; % the length we are going to cut the interval into
f = @(x) x.^5 - 3 * x .^ 2 + 1; % function that we want to find roots
fp = @(x) 5*x.^4 - 6*x; % the derivative of the function

num_raw = 0;
intervals = a:step:b;
raw_sol = zeros(length(intervals) - 1, 1); % a vector to store all the value from bisection
%disp(intervals)

% check for solution in each interval length of 0.25 with bisection method
for i = 2:length(intervals)
    fprintf("i:%d\n", i);
    fprintf("interval start: %f \n", intervals(i-1));
    fprintf("interval end: %f \n", intervals(i))

    x = bisection_tol(f,intervals(i-1),intervals(i),50,0.1);
    fprintf("x:%f\n",x)
    if(~isempty(x))
        raw_sol(i-1) = x;
        num_raw = num_raw + 1;
    end
    
    fprintf("raw_sol(i-1):%f\n",raw_sol(i-1));
    %res(i-1) = x;
end


% find the precise solution with Newton's method
% as 0 is obvious not a solution, we just need to scan all the non-zero sol
% in raw_sol
fprintf("---------------\n");
pre_sol = zeros(num_raw,1);
num_sol = 1;
%for i = raw_sol
%    fprintf("i:%f\n",i);disp(class(raw_sol));
%    if i ~= 0
%        fprintf("True");
%        sol = newton_tol(f,fp, i, 80, 10^-12);
%        fprintf("sol:%f\n",sol);
%        pre_sol(num_sol) = sol;
%        num_sol = num_sol + 1;
%    end
%end
%fprintf("solution: %f\n", pre_sol);
sol = 0;
for i = 1:length(raw_sol)
    if(raw_sol(i) ~= 0)
        sol = newton_tol(f,fp,raw_sol(i),30, 10^-12);
        fprintf("sol:%.13f\n",sol);
        pre_sol(num_sol) = sol;
        num_sol = num_sol + 1;
    end
end
disp(pre_sol)

%% Problem 2
% parameters:
a1 = -0.75;
b1 = -0.5;
a2 = -0.75;
b2 = -0.5;
[sol1, niter1, xiter1] = bisection_tol(f,a1,b1,50,0.1);
[sol2, niter2, xiter2] = newton_tol(f,fp, sol1,50, 10^-12);
fprintf("The total number of iteration for the previous method is: %d\n", ...
    niter2 + niter1);
[sol3,niter3,xiter3] = bisection_tol(f, a2,b2, 80, 10^-12);
fprintf("The total number of iteration for the bisection method is: %d\n", ...
    niter3);
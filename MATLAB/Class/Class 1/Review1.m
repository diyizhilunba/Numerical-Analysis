%% Review of 9/4's Lecture and MATLAB codes
%%basic calculation
a = 1;
b = 0.5;
v1 = [1;
    2;
    3;
    4;
    5];
a + b
disp(a * b);
disp("v1 * b"); 
disp(b * v1);
v2 = [1 3 5];
8 * v2
disp("v1 * v2");
v1 .* v2
disp("v2 * v1");
v2 .* v1
%% vector multiplication
v1 = [1;
    2;
    3;
    4;
    5];
v2 = [1;
    1;
    1;
    1;
    1]
v3 = [1 2 2 2 2];
v4 = repmat(v3,5,1);
a = 3
disp("v1 dot asterik v2");
disp(v1 .* v2);
%'.*' means element wise multiplication, 
% where A_(ij) = a_(ij) * b_(ij) if a and b are two arrays(same shape
% vectors)
% if a and b are respectively row and column vectors, A_(ij) = a(i) * b(j),
% or enlarge and and b into a same size matrix with multiple a and b
disp("a times v1");
disp(a * v1);
disp(a .* v1);
disp('v1 and v3')
disp(v1 * v3);
disp(v1 .* v3);
disp(v1 .* v4);
%solve Linear equation
A = [1,3,3;
    2,3,4;
    6,4,5];
b = [8;
    9;
    3];
x = A\b %\b to find the A^-1 b
disp('A');
disp(A');%conjugate transpose
% SVD
[U,S,V] = svd(A)
disp([U,S,V])
%% useful functions
A = linspace(0,100,11);%11 numbers uniformly distributed from 0 to 100
%start, end, number of numbers(len of array)
disp(A)
%% define functions or directly creating related results
% create functions
f = @(x) 2 .^x;
disp(f(3));
a = linspace(1,10,2000);
disp(f(a));
% or we can directly create one
g = 2 .^ a;
disp(f(a) - g);
%% Plotting
figure(1);
subplot(1,2,1);%rows, columns, and number of plots(5 means the 5th subplot 
% in the plot)

plot(a,f(a),'-');hold on %hold on to continue drawing on the same plot
plot(a, f(a)- 0.5 *g, 'o');
%x-value, y-value, notation, color...
title('plot 1');
subplot(1,2,2);

semilogy(a,f(a),'.');hold on
loglog(a,f(a),'o');
title('plot 2');%the two line are almost the same as log y is 
% approximately y



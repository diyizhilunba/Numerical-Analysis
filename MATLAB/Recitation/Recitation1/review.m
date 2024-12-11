%% Review content
% THere is no code for directly e, but you can use
x = exp(1) % or just exp(1) directly
% suppress output - use semicolon
x = 3;
y = x + 5;
%% add comments
% for comment
% 2 * % to break codes into section
%{
This is a block comment
%}
%% vectors
r_row = [1,3,5,7,9];
r_row = [1 3 5 7 9];% This is the same as the last one
r_clo = [1;3;5;7;9];
%% matrix
A = [1 2 3; 4 5 6; 7 8 9];
A = ones(9) % 9 * 9 matrix of 1
A = zeros(9)
A = eye(9)% eye for identity matrix
A = ones(2,3) % 2 x 3 matrix
A = eye(2,3)
B = [1 2 3; 4 5 6];
disp(B\A)
disp(B/A)
%% for loop 
x = 0; 
nither = 5;
for i = 1:nither
    x = x + i;
end
fprintf("The result is %f\n", x);
fprintf("The result is %d\n", x);
fprintf("The result is %s\n", x)
% d is for decimal(base 10 integer)
% s is for string
% use cast(A, new datatype) to cast A into new datatype
% use cast(A, 'like', p) to cast A into the same datatype as p
%% continue statement
a = 9;
while a < 20
    a = a + 1;
    if a == 15
        fprintf("skip 15\n")
        continue % skipping a == 15
    end
end
fprintf("a = %d", a);
%% if
limit = 0.5;
A = rand(10,1);% create a random 10 x 1 vector with element in U(0,1)

if any(A > limit)
    disp("There is at least 1 value above the limit")
else
    disp("No")
end
x, minVal, maxVal = 10,2, 6;
if(x >= minVal) && (x <= maxVal)
    disp("Value wwithin specified range")
elseif(x > maxVal)
    disp("Too big")
else
    disp("Too small")
end
%% function definition
% inline function
sqr = @(x) x.^2;% you can define it everywhere as a variable
a = sqr([3 5])
% syntax of a function statement is 
quadratic(2,4,-4)
function [x1,x2] = quadratic(a,b,c)
x1 = (-b + c)/(2 * a);
x2 =(-b -c)/(2 * a);
end

%% function handle
% need this when you pass a functiion as argument into a funciton
% used for things like input function into function
% if it is an inline function, you are good
% if not, create an inline function for that function
f = @sin;
integral(f,0,1)
integral(sqr, 0, 1)
%% linspace(start, end, n = 100)
% generate n evenly distributed points from start to end(included both points)
y1 = linspace(-5,5,10)
% say we need to seperate a line into 8 pieces
y2 = linspace(-5,5, 9)% as both start and end points included)
%% a:dx:b may be a better way to do
disp(0:0.2:1);
%% vector slicing
v = [1 2 3 4 5 6 7 8 9 0]
% note that it starts with 1 but not 0
v(1)
v([1 7 8])
v(3:7)
v(3:2:7)
v(1:2:end)
v(end: -1: 1)

%% call functions from .m file
% you should make 1 function in 1 file only
% and name the file with the function name
% and use addpath
%% plot
set(groot, 'defaultLineLIneWidth',2)%set line width
figure(1)
x = linspace(0, 2*pi, 101);
y1 = sin(x);
y2 = sin(x-0.25);
y3 = sin(x-0.5);
plot(x, y1, '-');
xlabel('x');
ylabel('y');
title('Plot of y = sin(x)');%usually the syntax is "Plot of......"
xlim([0, 2*pi]) % limit of x axis
%legend('y = sin(x)')
plot(x,y1,'-');
%legend('y = sin(x)')
hold on

plot(x,y2,'--');
%legend('y = sin(x - 0.25)')
hold on 
plot(x, y3, ":");
%legend('y = sin(x - 0.5)')
hold off
% put all the decoration here
legend('y = sin(x)', 'y = sin(x - 0.25)', 'y = sin(x - 0.5)')
%% 
x = 0: 0.05:1;
y1 = exp(-x);
y2 = exp(-2*x);
loglog(y1,y2);
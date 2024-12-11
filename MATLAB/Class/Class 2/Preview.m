lookfor Sum;
x = [1:0.5:3]
x = linspace(1,3,6)
%% plotting
% easiest:
x = linspace(1,10,200);
plot(x,cos(x));
% with function:
f = @(x)cos(x)
plot(x,f(x))
% with more feature like label 
% put after the plotting
title("x-cos(x) graph");
xlabel('x');
ylabel('cos(x)');
legend('x-cos(x)');
% multiple functions and multiple graphs
figure(2);
g = @(x)sin(x);
plot(x,f(x),x,g(x));
legend("cos(x),sin(x)");
% or use hold on/off
figure(3);
plot(x,f(x),'ro'); hold on%red circle
plot(x,g(x),"-");
hold off
clear
%% loop
sum = 0;
for i = 1:4
    sum = i + sum; %cannot do +=
end;
for i = 1:4, sum = i+ sum; end;
disp(sum)
%while loop and input
num1 = input("enter num1");
num2 = input('enter num2');
while num1 < num2,
    num1 = input("enter num1");
    num2 = input('enter num2');
end;
%% if
num1 = input('Enter num1: ');
num2 = input('Enter num2: ');
if num1 < num2,
    fprintf("%f is bigger", num2);
else if num1 == num2,
    fprintf("The two number are the same");
else,
    fprintf("%f is bigger", num1);
end;
end;
%% Bisection, example on finding root of f= x^3 - x^2 - 1 in [0,2]
% we cannot estimate the root exactly, 
% as long as it is close enough to 0(like 0.00000001), it is satisfied

delta = 0.0000001;%this does not mean to find solution close to 0.00001, 
% but if a and b are close enough, they should become a solution of 0 with
% a small error
f = @(x) x^3 - x^2 - 1;
a = input("Enter the interval you want to find root to begin: ");
b = input("Enter the interval you want to find root to end: ");
%check if the border is 0
if f(a) == 0
    fprintf("%f is the root of f", a);
    return;
end
if f(b) == 0
    fprintf("%f is the root of f", b);
    return;
end
%check if the result of f(a) and f(b) have different signs
if f(a) * f(b) > 0
    fprintf("The interval [%f, %f] is not suitable for bisection",a,b);
    return;
end

% do the bisection calculation
while abs(a - b) > delta
    c = (a+b)/2;
    fprintf("c: %f", c)

    if(f(c) == 0)
        fprintf("The solution is %f",c);
        return;
    end
    
    if(sign(f(c)) == sign(f(a)))
        a = c;
        fprintf("a: %f",a);
        fprintf("b: %f \n",b);
    else
        b = c;
        fprintf("a: %f ",a);
        fprintf("b: %f \n",b);
    end
end
fprintf("The solution is %f", (a+b)/2);

  



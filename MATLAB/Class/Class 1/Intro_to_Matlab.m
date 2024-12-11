x = 2;
y = 2;
z = x + y;
disp(z)


%% Linear Algebra
x = [1,
    2,
    3];
A = rand(3,3);% random 4 x 3 matrix
y = A * x
B = rand(4,3)
C = B * A %% If you don't play semicolon in the end, 
% matlab will show the result

%Solve linear system Ax = b
b = rand(3,1);
x = A\b
%SVD Decomposition
[U,S,V] = svd(A)

%%Nonlinear Solvers for f(x) = 0
f = @(x) exp(-x) .* cos(x); % define a function f of(@) x 
%remind the dot product
%If you don't remeber, just google it
x = linspace(-10,10,1000);
figure(1);
plot(x,f(x), '.'); hold on% or use '-' for the last one

x0 = -9;
x0 = fzero(f,x0);
plot(x0,f(x0), "o")
f(x0)


%%Plot a special function
x = linspace(0,100,1000);
J0= besselj(0,x)%define a bessel function

figure(2);
plot(x,J0,'-')

%%ploting algebraic growth
x = linspace(1,2,100);
p = 3;
y = (3+x) .^ p;%maybe because x is vector
figure(3)
subplot(2,1,1)
plot(x,y,'-');
subplot(2,1,2);
loglog(x,y,'-');

%% Plotting exponential graph
a = 3;
y = a.^ x;
figure(4);
subplot(2,1,1);
plot(x,y,'-');
title("exponential graph x-y");
subplot(2,1,2);
semilogy(x,y,'-');
title("exponential graph logy-x");

%% Equations of projectile motion
%Constants
g = 9.8;
v0 = 15;
theta = linspace(0,pi/2,1000);%the angle to shoot

%function
f = v0^2/g * sin(2.*theta) - d;
figure(5);
plot(theta,f,"-");%no need for paranthesis of f as its value is already there
xlabel("\theta");
ylabel('f')
%if f is function, use fzero to solve for result  
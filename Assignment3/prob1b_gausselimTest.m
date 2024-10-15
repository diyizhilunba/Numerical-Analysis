addpath Assignment\Assignment3

A = [10^-20 1;
    1 1];
b = [1;
    2];
%% Revision on 4d
% calculation
x = gausselim(A,b);
disp(x); 
% Error
disp("Error")
disp(norm(x - A\b));

%% Revision on 4e
A = 2*rand(1000)-1;
A = A/norm(A);
xtrue = 2*rand(1000,1)-1;
xtrue = xtrue/norm(xtrue);
b = A*xtrue;

x = gausselim(A,b);
%disp(x)
disp("The error in the Euclidean norm")
disp(norm(xtrue-x));
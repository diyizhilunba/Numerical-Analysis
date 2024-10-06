addpath Assignment\Assignment2\functions\

A = 2*rand(1000)-1;
A = A/norm(A);
xtrue = 2*rand(1000,1)-1;
xtrue = xtrue/norm(xtrue);
b = A*xtrue;

[L,U,~] = lu_nopivot(A,b);
y = forwardsub(L,b);
x = backsub(U,y);
disp("The solution by LU factorization is")
disp(x)
disp("The actual solution is")
disp(A\b)
disp("The error in the Euclidean norm")
disp(norm(x-A\b));
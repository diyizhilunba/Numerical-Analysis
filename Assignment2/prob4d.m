addpath Assignment\Assignment2\functions\

A = [10^-20 1;
    1 1];
b = [1;
    2];

[L,U,~] = lu_nopivot(A,b);
y = forwardsub(L,b);
x = backsub(U,y);
disp("The solution by LU factorization is")
disp(x)
disp("The actual solution is")
disp(A\b)
disp("The error in the Euclidean norm")
disp(norm(x-A\b));
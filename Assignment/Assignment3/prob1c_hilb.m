% create a function to calculate all the output we need
% Intput:
% n:    The size of the hilbert matrix
% Output:
% b:    The right hand side of the equation
% x:    The solution found using gausselim
% err:  The error between x and the true solution
% KHn:  The condition number for Hn
addpath Assignment\Assignment2
function [b,x,err,KHn] = hilbert_solution(n)
    b = zeros(n,1);
    for i=1:n
        for j = 1:n
            b(i) = b(i)+1/(i+j-1);
        end
    end
    x = gausselim(hilb(n),b);
    KHn = cond(hilb(n));
    err = norm(x-ones(n,1))/norm(ones(n,1));
end

error = zeros(14,0);
cond_num = zeros(14,0);
res = zeros(14,0);
for n = 2:15
    [b,x,err,KHn] = hilbert_solution(n);
    error(n-1) = err;
    cond_num(n-1) = KHn*eps;
    res(n-1) = norm(hilb(n) * x - b)/norm(b);
end
disp(error)
disp(cond_num)
semilogy(2:15,error,2:15,cond_num,2:15,res);
legend({"relative error","Upper bound: $\kappa(H_n)\varepsilon$","relative " + ...
    "residue error"},'Interpreter','latex',"Location","northwest");
title("Plot of error, error bound, and residue error of solving Hilbert Matrix");


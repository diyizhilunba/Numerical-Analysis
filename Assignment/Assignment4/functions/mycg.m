function [x,err_vec] = mycg(A,b,x0,err_tol,max_iter)
%MYCG Summary of this function goes here
%   Detailed explanation goes here
%   Inputs:
%   A:          a symmetric positive definite matrix A 
%   b:          right hand side
%   x0:         initial guess
%   err_tol:    error_tolerance
%   max_iter:   maximum number of iteration
%   Output:
%   x:          the approximate solution
%   err_vec:   the vector contains all the errors e_k
r = b- A*x0;
p = r;
x = x0;
err_vec = zeros(max_iter, 1); 
err_vec(1) = sqrt(r' * A * r);         
count = 1;
while(sqrt(r' * A * r) > err_tol) && (count <= max_iter)
    Ap = A * p;
    alpha = (r' * A * r) / (p' * A * Ap);
        
    x = x + alpha * p;
        
    r_new = r - alpha * Ap;
        
    err_vec(count,1) = sqrt(r_new' * A * r_new);
        
    if (sqrt(r_new' * A * r_new) <= err_tol) 
        err_vec = err_vec(1:count);  
        break;
    end
        
    beta = (r_new' * A* r_new) / (r' * A * r);
        
    p = r_new + beta * p;
        
    r = r_new;
    count = count + 1;
end
if count > max_iter
    err_vec = err_vec(1:max_iter);
end
end


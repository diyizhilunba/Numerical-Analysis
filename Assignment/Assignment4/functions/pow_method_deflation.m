function [evec,eval, xiter, err_iter] = pow_method_deflation(A, w, v1, real_evec, err_bound)
%POW_METHOD Summary of this function goes here
%   Detailed explanation goes here
err_iter = zeros(10^5,1);
y0 = w./norm(w);
y = y0;
xiter = 0;
lambda = 0;
while(abs(norm(y-real_evec)) >= err_bound)
    xiter = xiter + 1;
    yhat = A * y;
    if(yhat(1,1) *real_evec(1,1) < 0)
        yhat = -yhat;
    end
    yhat = yhat - v1 * v1' * yhat; 
    lambda = yhat' * y;
    y = yhat./norm(yhat);
    err = norm(real_evec - y);
    err_iter(xiter) = err;
end

for i = xiter+1:length(err_iter)
    err_iter(end) = [];
end
evec = y;
eval = lambda;
end


function [evec,eval, xiter, err_iter] = rqi(A, w, s, real_evec, err_bound)
%RQI Summary of this function goes here
%   Detailed explanation goes here
%   Input:
%   A:  the matrix we use to find epairs
%   w:  Initial guess
%   s:  We want to find the eignvalue closest to s
%   real_evec: the real corresponding evec to calculate error
%   err_bound: max error tolerance
err_iter = zeros(10^5,1);
y0 = w./norm(w);
y = y0;
xiter = 0;
lambda = s;
while(abs(norm(y-real_evec)) >= err_bound)
    xiter = xiter + 1;
    y = (A-lambda.*eye(length(A)))\y;
    y = y/norm(y);
    lambda = y' * (A * y);
    err = norm(real_evec - y);
    err_iter(xiter) = err;
end

for i = xiter+1:length(err_iter)
    err_iter(end) = [];
end
evec = y;
eval = lambda;
end


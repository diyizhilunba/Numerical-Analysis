% Solve f(x)=0 for scalar x by secant method
%
% Inputs
% f         Function handle for f
% x0        First initial guess
% x1        Second initial guess
% itermax   Number of iterations
% tol       the maximum error can be accepted to the root
%
% Output
% x         Approximate root of f(x)=0
% xiter     Vector containing all iterates of secant method

function [x,niter,xiter] = secant_tol(f,x0,x1,itermax,tol)

xiter = zeros(itermax+1,1);   % Store each iterate of secant method
xiter(1) = x0;                % Initial guess
xiter(2) = x1;                % Initial guess
niter = 2;                    % Initial iteration
for i=2:itermax
    

    if (f(xiter(i))==f(xiter(i-1))) % If val of f agrees w/ previous iteration, terminate to avoid division by zero
        xiter(i+1:end) = [];
        x = xiter(i);
        return;
    end
    xiter(i+1) = xiter(i) - f(xiter(i))*(xiter(i)-xiter(i-1))/(f(xiter(i))-f(xiter(i-1))); % Secant iteration
    niter = niter + 1;
    % check if the difference between two consective trial is less than tol
    if abs(xiter(i+1) - xiter(i)) <= tol
        xiter(i+2:end) = [];
        x = xiter(i+1);
        return;
    end
end

x = xiter(itermax+1); % Final result is current iterate

end
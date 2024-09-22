% Solve f(x)=0 for scalar x by bisection method
%
% Inputs
% f         Function handle for f
% [a,b]     Initial guess interval
% itermax   Number of iterations
% tol       the maximum satisfying error
%
% Output
% x         Approximate root of f(x)=0
% xiter     Vector containing all iterates of bisection method
%
% Note: In bisection method, [a,b] must contain a root, and the sign of
% f(a) must differ from the sign of f(b). Otherwise, this function will
% return an empty result.

function [x,niter,xiter] = bisection_tol(f,a,b,itermax,tol);

fa = f(a);
fb = f(b);
niter = 0;

if (sign(fa)==sign(fb))
    warning('sign(f(a)) must be different from sign(f(b)); returned empty result');
    x = [];
    xiter = [];
    return;
end

xiter = zeros(itermax+1,1);   % Store each iterate of bisection method
for i=1:itermax

    c = (a+b)/2;    % Compute midpoint
    xiter(i) = c;   % Store this iterate
    fc = f(c);      % Evaluate f at midpoint
    niter = niter + 1; %increase the number of iteration by 1

    % Update interval
    if (sign(fa) ==sign(fc))
        a = c;
        fa = fc;
    elseif (sign(fb)==sign(fc))
        b = c;
        fb = fc;
    else % Since sign(f(a))/=sign(f(b)) always, f(c)=0 in this case
        x = c;
        xiter(i+1:end) = [];
        return;
    end
    %check if the error is already in tolerance
    if (i > 1 && abs(xiter(i)-xiter(i-1)) <= tol)
        xiter(i+1 : end) = [];
        x = xiter(i);
        return;
    end

    

        
end

x = (a+b)/2; % Final result is current midpoint
xiter(itermax+1) = x;

end
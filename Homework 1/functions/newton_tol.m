% Solve f(x)=0 for scalar x by Newton's method
%
% Inputs
% f         Function handle for f
% fp        Function handle for f'
% x0        Initial guess
% itermax   Number of iterations
% tol       The maximum tolerant error
%
% Output
% x         Approximate root of f(x)=0
% xiter     Vector containing all iterates of Newton's method

function [x,niter,xiter] = newton_tol(f,fp,x0,itermax,tol)

xiter = zeros(itermax+1,1);   % Store each iterate of Newton's method
xiter(1) = x0;                % Initial guess
niter = 0;                    % record the number of trials
for i=1:itermax
    
    niter = niter + 1;
    xiter(i+1) = xiter(i) - f(xiter(i))/fp(xiter(i)); % Newton iteration
    % check if the difference between two consective trial is less than tol
    if abs(xiter(i+1) - xiter(i)) <= tol
        xiter(i+2:end) = [];
        x = xiter(i+1);
        return;
    end

end

x = xiter(itermax+1); % Final result is current iterate

end
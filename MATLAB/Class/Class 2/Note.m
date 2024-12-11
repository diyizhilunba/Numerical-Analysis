fprintf("Numerical Analysis Class on 9/9/2024");
%% Bisection method
% itermax: the longest possible trial we have
% f: function handle for f
% [a,b]: the prd we want to iterate
%
function [x, xiter] = bisection(f,a,b, itermax)
fa = f(a);
fb = f(b);
if(sign(fa) == sign(fb))
    warning('sign fa must be different from sign fb, return empty');
    x = [];
    xiter = [];
    return;
end

xiter = zeros(itermax+1, 1);
for i = 1:itermax %start with 1 here, MATLAB is 1-indexing
    c = (a+b)/2
    xiter(i) = c;
    fc = f(c);
    
    if(sign(fa) == sign(fc))
        a = c;
        fa =fc;
    elseif (sign(fb) == sign(fc))
        b = c;
        fb = fc;
    else
        x = c;
        xiter(i+1:end) = [];
        return;
    end
end
x = (a+b)/2;
xiter(itermax + 1) = x;

end
%% Newton's Method
% Inputs
% f Function handle for f
% f' Function handle for f'
%x0 intitial guess
% itermax Numeber of iterations
%
% Output
% x Approximate root of f(x) = 0
% xiter Vector containing all trials



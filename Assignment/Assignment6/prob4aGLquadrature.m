addpath functions\
% parmeters
n = 3; % number of nodes
a = 0;
b = 1;

% calculate the nodes and weights
[x,w] = lgwt(n,a,b);

% get the approximation and error
approx = zeros(1,11);
error = zeros(1,11);

for k = 0:10
    GL_approx = 0;
    f = @(x)x.^k;
    for i = 1:length(x)
        GL_approx = GL_approx + f(x(i))*w(i);
    end
    approx(k+1) = GL_approx;
    true_val = 1/(k+1);
    error(k+1) = abs(true_val - GL_approx);
end
semilogy(0:10,error)
xlabel("k")
ylabel("Abosolute Error")
title('Gauss-Legendre Quadrature Error for Polynomials');

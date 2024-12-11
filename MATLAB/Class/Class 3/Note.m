% Test fixed point iteration for f(x) = x^3 + 6x^2 - 8 in [1,2]
g1 = @(x) x.^3 + 6 * x.^2 + x - 8
g2 = @(x) sqrt(8./(x+6));
g3 = @(x) sqrt((8-x.^3)/6);

x = 1.5;
for i = 1:30
    % x = g1(x) does not converge
    %x = g2(x)
    x = g3(x)
end
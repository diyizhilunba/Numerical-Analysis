%input coeffi: The coefficient vector
%input x: x from [-1,1]
%output p: p(x) calculated via chebyshev expansion


function p = evalcheb(coeffi, x)

len = length(coeffi);% get the length of the coeffi vector
T = zeros(1,len);% set a 1 by n matrix for T0-Tn-1
p = 0;

T(1) = 1;%initial setup
p = p+ T(1)*coeffi(1);
if len > 1% second num(if had)
    T(2) = x;
    p = p+ T(2)*coeffi(2);
end

if len > 2%third and more(if had)
    for i = 3: len
        T(i) = 2 * x * T(i-1) - T(i-2);%general formula
        p = p+ T(i)*coeffi(i);
    end
end


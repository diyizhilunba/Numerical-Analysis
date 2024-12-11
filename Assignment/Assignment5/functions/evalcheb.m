function p = evalcheb(coef, x)
%CHEBYPOLY Summary of this function goes here
%   Detailed explanation goes here
%   Input:
%   coeff: array of coefficients (a) of each term
%   x: the x value we want to calculate p
%   Output:
%   p: result of p(x)

n = length(coef);
    function T = chebypoly(ind,x)
        if(ind == 1)
            T = 1;
        
        elseif(ind == 2)
            T = x;
        
        else
            T = 2 * x .* chebypoly(ind-1,x) - chebypoly(ind-2,x);
        end
    end
p = 0;
for niter = 1:n
    p = p + coef(niter) * chebypoly(niter,x);
end
end


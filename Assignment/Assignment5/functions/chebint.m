function S_vv = chebint(n)
%CHEBINT Summary of this function goes here
%   Detailed explanation goes here
% Input:
% n:    size of the matrix
% Output:
% Svv: 'value to value' matrix
    
    cx = cos((2*(0:n-1)'+1)/(2*n)*pi);
    % T and S_cv
    S_cv = zeros(n);
    T = zeros(n, n);
   
    for i = 1:n
        T(:, i) = cos((i-1) * acos(cx));
    end
    for i = 1:n
        for j = 0:n-1
            if j == 0
                S_cv(i, j+1) = cx(i) + 1; 
            elseif j == 1
                S_cv(i, j+1) = 0.5 * (cx(i)^2 - 1); 
            else
                S_cv(i, j+1) = (cx(i)^j / (2 * j)) - (cx(i)^(j-2) / (2 * (j-2)));
            end
        end
    end
    S_vv = S_cv / T;
end

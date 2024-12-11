function Dvv = chebdiff(n)
%CHEBDIFF Summary of this function goes here
%   Detailed explanation goes here
%   input      n: the size of the matrix
%   output     Dvv: the value to value matrix we need

    D_cv = zeros(n);
    T = zeros(n);
    
    % Caluclate T and D_cv
    for j = 1:n
        for k = 1:n
            T(j,k) = cos((pi/n)*(j-1+1/2)*(k-1));
            D_cv(j,k) = (k-1) * sin((k-1)*(pi/n)*(j-1+1/2)) / sin((pi/n)*(j-1+1/2));%T' equation
        end
    end
    
    Dvv = D_cv/T;
end
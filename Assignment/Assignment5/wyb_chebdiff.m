%input n: positive integer
%output D: value to value matrix
function D = chebdiff(n)
if n == 0
    fprintf('Cannot generate!')
    return
end
%initialize matrix
    D_cv = zeros(n);
    T= zeros(n);
    
    % Caluclate T and D_cv(via T')
    for j = 1:n
        for k = 1:n
            % T equation
            T(j,k) = cos((pi/n)*(j-1+1/2)*(k-1));
            D_cv(j,k) = (k-1) * sin((k-1)*(pi/n)*(j-1+1/2)) / sin((pi/n)*(j-1+1/2));%T' equation
        end
    end
    
    D = D_cv/T;
end
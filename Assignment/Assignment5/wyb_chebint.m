%input n: positive integer
% output Svv: 'value to value' matrix


function S_vv = chebint(n)
    % initial setup
    S_cv = zeros(n);
    T = zeros(n, n);
    
    % solve T
    for j = 0:n-1
        for i = 0:n-1
            T(i+1, j+1) = cos(j * acos(cos(2*pi*(i+0.5)/(2*n))));
        end
    end

    %solve S_cv
    for i = 0:n-1
        x_i = cos((2*i + 1) * pi / (2 * n));% cheb node
        for j = 0:n-1
            k = j;
            if k == 0% case 1
                S_cv(i+1, j+1) = x_i + 1;%equation
            elseif k == 1%case 2
                S_cv(i+1, j+1) = 0.5 * x_i^2 - 0.5;% eqation
            else%general case with all three elements
                kplus1 = (1 / (2 * (k + 1))) * cos(pi / n * (i + 0.5) * (k + 1));
                kminus1 = (1 / (2 * (k - 1))) * cos(pi / n * (i + 0.5) * (k - 1));
                constant = (-1)^k / (1 - k^2);
                S_cv(i+1, j+1) = kplus1 - kminus1 + constant;
            end
        end
    end
    %Svv = Scv T^-1
    S_vv = S_cv / T;
end
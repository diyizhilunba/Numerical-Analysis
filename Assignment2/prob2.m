%% Question c for problem 2
function [x1,x2,niter] = multi_newton(f1,f2,df11,df12,df21,df22,x1,x2)
% parameters:
% f1, f2: the two original functions to solve
% df11, df12, df21, df22: the partial derivative of each function, 
% also the m,n th entry of the jacobian matrix
% x1, x2: initial guesses
% output:
% x1,x2: the final solution
% niter: the number of iteration needed

    
    niter = 0; % record the number of iteration
    while abs((dot(f1(x1,x2),f1(x1,x2))) + ...
            (dot(f2(x1,x2),f2(x1,x2)))) >= 10^-20
        % the loop to set the tolerance of the norm to 10^-10
        % to iterate to the next x, we need to solve 
        % f(xk) = J(xk)(x(k+1) - xk)
        fxk = [f1(x1,x2);f2(x1,x2)];
        Jac = [df11(x1,x2), df12(x1,x2);
            df21(x1,x2), df22(x1,x2)];
        % iterate to the next x
        inv = Jac\fxk;
        x1 = x1 - inv(1);
        x2 = x2 - inv(2);
        niter = niter + 1; % add the number of iteration with 1
    end

end
% set up the parameter
f1 = @(x1,x2) 5*x1 + x1.*x2.^2 + cos(3*x2).^2 - 1;
f2 = @(x1,x2) exp(2*x1-x2)+4*sin(x2) - 2;
df11 = @(x1,x2) 5 + x2.^2;
df12 = @(x1,x2) 2*x1*x2 + 2*cos(3*x2)*(-sin(3*x2))*3;
df21 = @(x1,x2) exp(-x2) * 2 * exp(x1);
df22 = @(x1,x2) -exp(2*x1-x2) + 4*cos(x2);
x1 = 0.103;
x2 = 0.241;
[x1,x2,niter] = multi_newton(f1,f2,df11,df12,df21,df22,x1,x2);
fprintf("The solution is: (%.10f,%.10f)\n",x1,x2);
fprintf("The number of iteration needed is: %d\n", niter);
% print the residual:
res = sqrt(f1(x1,x2)^2 +f2(x1,x2).^2);
fprintf("The residual error is: %.12f\n", res);

%% Use fsolve to find the real solution
function F = system_of_equations(x)
    % x is a vector of variables [x1, x2]
    x1 = x(1); % First variable
    x2 = x(2); % Second variable

    % Define the system of equations
    F(1) = 5*x1 + x1*x2^2 + cos(3*x2)^2 - 1;  % f1(x1, x2)
    F(2) = exp(2*x1 - x2) + 4*sin(x2) - 2;    % f2(x1, x2)

    % F should return a column vector
    F = F(:);  % Ensure F is a column vector for fsolve
end

% Initial guess for [x1, x2]
initial_guess = [0.103, 0.241];
% solving the solution
x_solution = fsolve(@system_of_equations, initial_guess);
% Display the results
fprintf('Solution:%.10f',x_solution); % Solution for [x1, x2]

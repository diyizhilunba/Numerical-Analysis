function y = forwardsub(L,b)
%FORWARDSUB Summary of this function goes here
% The part of the procedure to use LU decomposition to find x
% As Ax = b is the same as LUx = b
% We let y = Ux and solve Ly = b here
%   Detailed explanation goes here
%   parameters
%   L: the lower triangular matrix from LU decomposition
%   b: the right hand side of the equation
%   Output:
%   y: the solution, equals to Ux

n = length(L); % the size of the matrix
y = b;
for i = 1:n
    for j = 1:i-1
        y(i) = y(i) - L(i,j) * y(j);
    end
end



end


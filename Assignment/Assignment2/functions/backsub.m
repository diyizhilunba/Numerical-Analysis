function x = backsub(U,y)
%BackSub Summary of this function goes here
% The part of the procedure to use LU decomposition to find x
% As Ax = b is the same as LUx = b
% We let Ux = y here
%   Detailed explanation goes here
%   parameters
%   U: the upper triangular matrix from LU decomposition
%   y: the right hand side of the equation
%   Output:
%   x: the solution
n = length(U);
x = y;
for i = n:-1:1
    sum = 0;
    for j = n:-1:i+1
        sum = U(i,j) * x(j) + sum;
    end
    %fprintf("Sum:%f\n",sum);
    x(i) = (y(i) - sum)/U(i,i);
end

end


% LU factorization for Ax=b without pivoting
%
% Inputs
% A         Matrix of linear system
% b         Right-hand side of linear system
%
% Output
% L         Lower triangular matrix obtained by elimination on A
% U         Upper triangular matrix obtained by elimination on A
% y         Right-hand side vector transformed by elimination on A, such that
%           Ux = y
%
% Warning: Since this function does not use pivoting, it is likely to fail to
% produce an accurate solution in many cases.

function [L,U,y] = lu_nopivot(A,b)

n = length(b);
L = eye(length(b));
% Elimination
for j=1:n-1
    for i=j+1:n
        % The U part for the decomposition
        c = A(i,j)/A(j,j);% the coefficient we 
        % need to multiply to eliminate first entry
        A(i,j:n) = A(i,j:n) - c*A(j,j:n); % all the entries 
        % in ith row will be subtracted 
        b(i) = b(i) - c*b(j); % so does b

        % modify the L part of the decomposition
        L(i,j) =    c;

    end
end

U = triu(A);   % Upper triangular part of A
y = b;         % Transformed right-hand side

end
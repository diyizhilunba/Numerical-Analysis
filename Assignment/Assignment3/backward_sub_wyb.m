function [x] = backward_sub_wyb(U,b)

n = length(b);%take the size of the matrix
x = zeros(n,1);%initalize x
for i = n:-1:1%iterating from the last row to the first
    x(i) = b(i);
    for j = (i+1):n
        x(i) = x(i) - U(i,j)*x(j);%minus all known x
    end
    x(i) = x(i)/U(i,i);%divide by coefficient
end

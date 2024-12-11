function [U,y] = gausselim_nopivot(A,b)

n = length(b);

for j = 1:n-1
    for i  = j+1:n
        c = A(i,j)/A(j,j);
        A(i,j:n) = A (i,j:n) - c* A(j,j:n);% cuz every data before j is fixed(0), no need to calculate them again
        b(i) = b(i) - c*b(j);
    end
end

U = triu(A);
y = b;
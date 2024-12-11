
function [x] = gausselim_wyb(A,b)

n = length(b);

for j = 1:n-1 
    [~,pivot_row] = max(abs(A(j:n, j)));%identify the row with the largest elem in the column
    pivot_row = pivot_row + j - 1;


    if pivot_row ~= j
        A([j, pivot_row], :) = A([pivot_row, j], :); % swap rows in A
        b([j, pivot_row]) = b([pivot_row, j]);       % swap entries in b
    end

    for i = j+1:n
        if A(j, j) ~= 0 % check if non-zero
            c = A(i, j) / A(j, j);  % GE calculation
            A(i, j:n) = A(i, j:n) - c * A(j, j:n); 
            b(i) = b(i) - c * b(j);                
        else
            error('This is a singular matrix.'); % If the pivot is zero(since abs max) the matrix is singular
        end
    end
end

% backward sub
x = backward_sub_wyb(A,b);

end

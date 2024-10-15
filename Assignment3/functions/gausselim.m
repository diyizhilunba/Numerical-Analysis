
function x = gausselim(A,b)
%UNTITLED2 Summary of this function goes here
% A function that does gaussian elimination with partial pivoting
% Done with the function written before

%   Detailed explanation goes here
%   Inputs:
%   A:  The parameter matrix in Ax= b
%   b:  The right hand side of the equation Ax = b
%   Output:
%   x:  The solution we need


addpath Assignment\Assignment2;

n = length(A); % Size of the matrix

% partial pivoting: for each column, find the entry with the largest abs
% value, and make the row it locates the first row available
for i = 1:n
    %disp(abs(A(i:n,i)))
    [max_val,max_ind] = max(abs(A(i:n,i)));% find the max val in the col
    %fprintf("I: %d\n", i);
    %fprintf("max_val:%f\n", max_val);
    %fprintf("max_ind:%d\n", max_ind);
    %if max_val is zero, terminate the loop and say the matrix is singular
    if (max_val == 0)
        error("Error. The matrix is singular and cannot generate only one solution")
    end
    % if max_val is not zero, do the pivoting
    temp = A(i,:);
    A(i,:) = A(i + max_ind - 1,:);
    A(i + max_ind - 1,:) = temp; % switch bewteen two rows
    % change b
    temp = b(i);
    b(i) = b(i + max_ind - 1);
    b(i + max_ind - 1) = temp;
    %disp("The matrix now is:");
    %disp(A);
    
end

% Now solve the function
[U,y] = gausselim_nopivot(A,b);
x = backsub(U,y);






end
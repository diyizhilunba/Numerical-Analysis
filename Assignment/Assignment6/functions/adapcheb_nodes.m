function NodeGrid = adapcheb_nodes(n,p)
%ADAPCHEB_NODES Summary of this function goes here
%   Detailed explanation goes here
% Input:
% n:    number of panels on [0,1] that we are going to split
% p:    THe number of nodes on each panel
% Output:
% NodeGrid: p x n matrix that contains the value of all the nodes

% panel endpoints
x = zeros(1,n+1);
x(1) = 0;
x(2:end) = 2.^(-(n-(1:n)));

% generate chebyshev nodes on each panel
    
NodeGrid = zeros(p,n);
for k = 1:n
    a = x(k);
    b = x(k+1);
    cheb_nodes = (b-a)/2 * cos((2*(0:p-1)+1)/(2*p) * pi)+ (a+b)/2;
    NodeGrid(:,k) = cheb_nodes';
end
end


function approx = adapcheb_interp(n,p,node_val,x)
%ADAPCHEB_INTERP Summary of this function goes here
%   Detailed explanation goes here
% Input:
% n,p: Number of grids to get the chebyshev nodes on [0,1]
% node_val: value of the nodes, a p x n matrix
% x: the point to valuate
% Output:
% approx: approximate value by chebyshev interpolation

% find the panel x locates
if x == 0
    k = 1;
else
    k = floor(log2(x)) + n;
end

k = max(1, min(k, n)); % Ensure k is within bounds

% Find Cheby Nodes and relate value
NodeGrid = adapcheb_nodes(n,p);
cheb_nodes = NodeGrid(:, k);
cheb_val = node_val(:,k);

% weights
weights = (-1).^(0:p-1)' .* sin((2*(0:p-1)' + 1) * pi / (2 * p)); 


% result
approx = baryinterp(x, cheb_nodes, cheb_val, weights);

end


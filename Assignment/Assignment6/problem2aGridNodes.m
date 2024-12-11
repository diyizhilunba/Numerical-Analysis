addpath functions\
% parameters
n = 6;
p = 4;

% find node grid
NodeGrid = adapcheb_nodes(n,p);
all_nodes = NodeGrid(:);

% Plot the nodes
Panels= zeros(1,n+1);
Panels(1) = 0;
Panels(2:end) = 2.^(-(n-(1:n)));

% Plot the nodes
figure;
hold on;
% Plot panels as vertical lines
for k = 1:length(Panels)
    xline(Panels(k), 'r--', 'LineWidth', 1.5); % Dashed red lines for panels
end
% Plot the Chebyshev nodes
scatter(NodeGrid, zeros(size(NodeGrid)), 'filled');
xlabel('x');
ylabel('Nodes (y = 0 for visualization)');
title('Composite Chebyshev Nodes and Panels for n = 6, p = 4');
grid on;
legend('Panels', 'Chebyshev Nodes', 'Location', 'northwest');
hold off;
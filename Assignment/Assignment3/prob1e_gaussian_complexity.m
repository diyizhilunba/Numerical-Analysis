% Measure wall-clock time of nxn matrix-matrix multiplication with increasing n

plotsettings;

ns = 2.^(5:10);           % Sizes of matrices to multiply
times = zeros(size(ns));  % Vector to store times

maxNumCompThreads(1);     % Single-threaded timings

for i = 1:length(ns)
    n = ns(i);
    A = rand(n); % Random n x n matrix
    b = rand(n,1); % Random n x 1 vector

    tic;
    x = gausselim(A,b);   % Multiply A by itself, throw out result
    times(i) = toc;       % Store elapsed time

    fprintf('n = %4d: %10.4f s\n', n, times(i));
end

% Plot the results
figure(1);
loglog(ns, times, 'o-', ns, times(end)/((2^9)^3) * ns.^3, '--k');
xlabel('Matrix size n');
ylabel('Time (s)');
legend('Measured time', '$\mathcal{O}(n^3)$', 'Location', 'NorthWest');
set(gca, 'FontSize', labelsize);
title("Plot of Complexity of Gaussian Elimination over O(n^3)",'FontSize',10);

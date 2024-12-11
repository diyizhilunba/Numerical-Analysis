%plot settings;
ns = 2 .^ (5:12);
times = zeros(size(ns));

maxNumCompThreads(1); % single-threaded timings

for i = 1: length(ns)
    n = ns(i);
    A = rand(n);%random n*n matrix

    tic;%start the clock
    A*A;
    times(i) = toc;%end the clock, record it

    fprintf('n = %4d: %10.4f s\n',n,times(i));
end

%Plot
figure(1);
loglog(ns, times, 'o-',ns,times(end)/((2^12)^3) *ns.^ 3, '--k');
xlabel("matrix size n")
ylabel('time(s)');
legend('Measured time','O(n^3)');
%% Gaussian Elimination
addpath Numerical Analysis\MATLAB\Class\Class 5\functions

A = rand(500);
b = rand(500,1);
[U,y] = gausselim_nopivot(A,b);

x = U \y;
disp(max(abs(A*x-b)));%due to finite pt calculation


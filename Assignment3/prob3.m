%% Problem 3b
plotsettings;

% Generate 500 points on [0,2pi]
ndata = 500;
f = @(x) cos(sin(x)) .^3;
xdata = 2*pi*rand(ndata,1);
fdata = f(xdata) + 0.05*randn(ndata,1);

% first we find a0 to a9
% parameter matrix A
A = zeros(500,10);
for i = 1:500
    for j = 1:10
        A(i,j) = cos((j-1)*xdata(i));
    end
end

% calculate the result
[Q,R] = qr(A);
% As Rx = Q'b
coeff = R\(Q'*fdata);
%disp(coeff);

% Calculate f(x) and fhat(x)
xiter = linspace(0,2*pi,1000)';
%disp(xiter)
fx = f(xiter);
% new parameter matrix A
A = zeros(1000,10);
for i = 1:1000
    for j = 1:10
        A(i,j) = cos((j-1)*xiter(i));
    end
end
fhatx = A * coeff;

% Plot the Graph
figure(1)
plot(xiter, fx, 'r-', xiter, fhatx, 'b--', xdata, fdata,"o")
legend("$f(x)$","$\hat{f}(x)$","noisy data")
title("Plot of estimation and real f(x) with Fourier Series")
% calculate the max error
max_error = max(abs(fhatx-fx));
disp("max error:")
disp(max_error);

% Rayleigh quotient
n = 50;
niter = 5;

[~,D] = eig(A);
D = diag(D);

rng(5);
A = rand(n);
A = (A+A')/2;

% Initial guess
lambda = 0.22;
y = rand(n,1);

for k = 1:niter
    y = (A-eye(n)*lambda)\y;
    y = y/norm(y);
    lambda = y.'*(A*y);
    disp(k);
    %disp(lambda);
    %disp(abs(lambda - D(4,4)))
end
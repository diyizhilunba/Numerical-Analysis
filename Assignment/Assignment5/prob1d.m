% Prob 1d
%% section 1: plot the interpolant
addpath functions
plotsettings;

n = 25;                 % Number of interpolation nodes
neval = 1000;            % Evaluation grid
a = -1;
b= 1;

% A few functions to choose from
% f = @(x) sin(2*pi*x);
f1 = @(x) exp(-4*x.^2);
f2 = @(x) exp(-16*x.^2);
f3 = @(x) exp(-64*x.^2);
% f = @(x) tan(x);
% f = @(x) exp(cos(300*x).^2);

xc = cos((2*(0:n-1)'+1)/(2*n)*pi);  % Chebyshev interpolation nodes

% Barycentric interpolation weights for Chebyshev nodes
wc = (-1).^(0:n-1)'.*sin((2*(0:n-1)'+1)/(2*n)*pi);

y1 = f1(xc);               % Function values at interpolation nodes
y2 = f2(xc);  
y3 = f3(xc);  

xeval = linspace(a,b,neval).';

p1 = zeros(neval,1);
p2 = zeros(neval,1);
p3 = zeros(neval,1);

for k=1:neval
    p1(k) = baryinterp(xeval(k),xc,y1,wc);
    p2(k) = baryinterp(xeval(k),xc,y2,wc);
    p3(k) = baryinterp(xeval(k),xc,y3,wc);
end

hfig = figure(1);

plot(xeval,f1(xeval),'-','Linewidth',4); hold on
plot(xeval,p1,'.-')
plot(xc,f1(xc),'.r','MarkerSize',20);
plot(xeval,f2(xeval),'-','Linewidth',4); hold on
plot(xeval,p2,'.-')
plot(xc,f2(xc),'.r','MarkerSize',20);
plot(xeval,f3(xeval),'-','Linewidth',4); hold on
plot(xeval,p3,'.-')
plot(xc,f3(xc),'.r','MarkerSize',20);
hold off
labelsize = 8;
legend('True function1','Chebyshev interpolant1','Data points1', ...
    'True function2','Chebyshev interpolant2','Data points2', ...
    'True function3','Chebyshev interpolant3','Data points3')
legend("Location","northeast")
xlabel('$x$')
title('Polynomial interpolation at Chebyshev nodes')
set(gca,'fontsize',labelsize)

%% section 2: calculate max error
nmax = 100;

neval = 1000;            % Evaluation grid
a = -1;
b= 1;
xeval = linspace(a,b,neval).';

% A few functions to choose from
f1 = @(x) exp(-4*x.^2);
f2 = @(x) exp(-16*x.^2);
f3 = @(x) exp(-64*x.^2);

err1 = zeros(nmax,1);
err2 = zeros(nmax,1);
err3 = zeros(nmax,1);

for niter = 1:nmax
    xc = cos((2*(0:niter-1)'+1)/(2*niter)*pi);  % Chebyshev interpolation nodes

    % Barycentric interpolation weights for Chebyshev nodes
    wc = (-1).^(0:niter-1)'.*sin((2*(0:niter-1)'+1)/(2*niter)*pi);

    y1 = f1(xc);               % Function values at interpolation nodes
    y2 = f2(xc);  
    y3 = f3(xc);  
    
    

    p1 = zeros(neval,1);
    p2 = zeros(neval,1);
    p3 = zeros(neval,1);

    for k=1:neval
       p1(k) = baryinterp(xeval(k),xc,y1,wc);
       p2(k) = baryinterp(xeval(k),xc,y2,wc);
       p3(k) = baryinterp(xeval(k),xc,y3,wc);
    end
    err1(niter) = max(abs(f1(xeval)-p1));
    err2(niter) = max(abs(f2(xeval)-p2));
    err3(niter) = max(abs(f3(xeval)-p3));
end
fig = figure(2);
semilogy(1:nmax,err1,'.-');hold on
semilogy(1:nmax,err2,'.-');
semilogy(1:nmax,err3,'.-');hold off
legend("Function 1","Function 2","Function 3")
xlabel('$n$')
ylabel('Maximum Absolute error')
title('Chebyshev interpolation error')
set(gca,'fontsize',labelsize)



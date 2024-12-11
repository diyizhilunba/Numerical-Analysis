% Prob 1c
%% section 1: plot the interpolant
addpath functions
plotsettings;

n = 25;                 % Number of interpolation nodes
neval = 1000;            % Evaluation grid
a = -1;
b= 1;

% A few functions to choose from
% f = @(x) sin(2*pi*x);
f1 = @(x) abs(x);

% f = @(x) tan(x);
% f = @(x) exp(cos(300*x).^2);

xc = cos((2*(0:n-1)'+1)/(2*n)*pi);  % Chebyshev interpolation nodes

% Barycentric interpolation weights for Chebyshev nodes
wc = (-1).^(0:n-1)'.*sin((2*(0:n-1)'+1)/(2*n)*pi);

y1 = f1(xc);               % Function values at interpolation nodes


xeval = linspace(a,b,neval).';

p1 = zeros(neval,1);


for k=1:neval
    p1(k) = baryinterp(xeval(k),xc,y1,wc);
    
end

hfig = figure(1);

plot(xeval,f1(xeval),'-','Linewidth',4); hold on
plot(xeval,p1,'.-')
plot(xc,f1(xc),'.r','MarkerSize',20);

hold off
labelsize = 8;
legend('True function1','Chebyshev interpolant1','Data points1')
legend("Location","northeast")
xlabel('$x$')
title('Polynomial interpolation at Chebyshev nodes')
set(gca,'fontsize',labelsize)

%% section 2: calculate max error
nmax = 11;

neval = 1000;            % Evaluation grid
a = -1;
b= 1;
xeval = linspace(a,b,neval).';

% A few functions to choose from
f1 = @(x) (x < 0) .* 0 + (x >= 0) .* x.^2;


err1 = zeros(nmax,1);


for niter = 2:nmax+1
    xc = cos((2*(0:(2^niter)-1)'+1)/(2*(2^niter))*pi);  % Chebyshev interpolation nodes

    % Barycentric interpolation weights for Chebyshev nodes
    wc = (-1).^(0:(2^niter)-1)'.*sin((2*(0:(2^niter)-1)'+1)/(2*(2^niter))*pi);

    y1 = f1(xc);               % Function values at interpolation nodes
  
    
    

    p1 = zeros(neval,1);
   

    for k=1:neval
       p1(k) = baryinterp(xeval(k),xc,y1,wc);
       
    end
    err1(niter-1) = max(abs(f1(xeval)-p1));
    
end
fig = figure(1);
n = 2.^(2:nmax+1);
loglog(n,err1,'.-');hold on
loglog(n,0.3*n.^-(2),'.-');hold on

hold off
legend("Function 1","$0.3 n^{-2}$")
xlabel('$n$')
ylabel('Maximum Absolute error')
title('Chebyshev interpolation error')
set(gca,'fontsize',labelsize)



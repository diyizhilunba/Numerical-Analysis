% Prob 3b
%% section 1: calculate max error
addpath functions
plotsettings;


neval = 1000;            % Evaluation grid
a = -1;
b= 1;

nmax = 20;


xeval = linspace(a,b,neval).';
chebyshev_poly = @(k, x) cos(k * acos(x)); 

% A few functions to choose from
f1 = @(x)exp(-x.^2);

eval_err = zeros(nmax,1);
bary_err = zeros(nmax,1);


for niter = 1:nmax
    xc = cos((2*(0:niter-1)'+1)/(2*niter)*pi);  % Chebyshev interpolation nodes
    % Ta = b
    bi = f1(xc);
    % Construct the Chebyshev matrix
    T = zeros(niter);
    for j = 1:niter
        T(:, j) = chebyshev_poly(j-1, xc); % Evaluate T_{j-1}(x)
    end
    a = T\bi;
    eval_p = zeros(neval,1);
    for k=1:neval
       eval_p(k) = evalcheb(a,xeval(k));
       
    end
    eval_err(niter) = max(abs(f1(xeval)-eval_p));
    
    %Usual CHebyshev interpolant method with barycentric interpolation
    % Barycentric interpolation weights for Chebyshev nodes
    wc = (-1).^(0:niter-1)'.*sin((2*(0:niter-1)'+1)/(2*niter)*pi);

    y1 = f1(xc);               % Function values at interpolation node
    

    bary_p = zeros(neval,1);
    

    for k=1:neval
       bary_p(k) = baryinterp(xeval(k),xc,y1,wc);
       
    end
    bary_err(niter) = max(abs(f1(xeval)-bary_p));
    
end

fig = figure(1);
semilogy(1:nmax,bary_err,'.-','Linewidth',4);hold on
semilogy(1:nmax,eval_err,'.-');hold off
legend("Barycentric","Chebyshev")
xlabel('$n$')
ylabel('Maximum Absolute error')
title('Chebyshev interpolation error')
set(gca,'fontsize',labelsize)

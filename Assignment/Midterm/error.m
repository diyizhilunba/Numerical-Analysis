error1 = @(x)(1/3).^x;
error2 = @(x)(1/2).^(2.^x);
xiter = linspace(1,20 ,1000);

semilogy(xiter,error1(xiter),xiter,error2(xiter));
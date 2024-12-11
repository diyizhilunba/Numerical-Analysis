niter = 60;
x0 = 0.1;

x = x0;
for k = 1:niter
    fprintf('k = %d, x = %0.18f \n', k , x);
    if(0<= x && x<= 0.5)
        x = 2 * x;
    else
        x = 2*x -1;
    end
end
% you can see the error grows by 2 every time. and finally causing an error

%% stable algo
x = 1.0000023;
y = x - 1;
fprintf("y: %f\n", y);% you can find that it has only 2 sig fig
% what if we have 10^-8 error in x
x = x + 10^-8;
y = x - 1;
fprintf("y: %f\n", y);
x = 1e-3;
truesol = 2 * sin(x/2)*2;
fprintf("true sol: %f\n", truesol);
wrongsol = 1-cos(x);
fprintf("wrong sol: %f\n", wrongsol);% they should be same in real math


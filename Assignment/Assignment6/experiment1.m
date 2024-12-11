% Try to find if there is a change in barycentric weight if we change the
% range from [-1,1] to [a,b] for chebyshev nodes
function Y = scaling(x,a,b)
    Y = (b-a)*x/2 + (b+a)/2;
end
n = 10;
chebnodes = cos(((2*(0:n-1))+1)/(2*n)*pi);
a = -2;
b = 2;

scaleCheb = scaling(chebnodes,a,b);

baryweight1 = 1;
baryweight2 = (-1)^0 * sin((2*0+1)/(2*n)*pi);
scaleweight = 1;
for i = 2:n
    baryweight1 = baryweight1/(chebnodes(1) - chebnodes(i));
    %scaleweight = scaleweight/(scaleCheb(1) - scaleCheb(i));
end

disp(baryweight1)
%disp(scaleweight)
%disp(scaleweight/((b-a)/2)^(n-1))
%disp(scaleweight*((b-a)/2)^(n-1))
%disp(baryweight1/(scaleweight*((b-a)/2)^(n-1)))
disp(baryweight2)

%%


n = 10;
a = -2;
b = 2;

% Generate Chebyshev nodes with zero-based indexing
j = 0:(n-1);
chebnodes = cos((2*j+1)/(2*n)*pi); 

% We will compute the barycentric weight for the first node (j=0)
% j=0 node:
% x_0 = cos(pi/(2n))
% w_0 = sin(pi/(2n))

% Product-based barycentric weight for the node j=0:
baryweight1 = 1;
for i = 2:n
    baryweight1 = baryweight1/(chebnodes(1) - chebnodes(i));
end

% Closed-form barycentric weight for j=0:
baryweight2 = (-1)^0 * sin((2*0+1)/(2*n)*pi);

disp('baryweight1 = ')
disp(baryweight1)
disp('baryweight2 = ')
disp(baryweight2)

%% 3a
A = [1 1/2 1/6 1/24;
    1 1/2 -1/6 1/24;
    1 2 4/3 2/3;
    1 2 -4/3 2/3];
x = [8;
    -8;
    -1;
    1];
disp("AX")
disp(A*x)
A = A';
b = [0;
    0;
    0;
    0];
x = A\b;
%% 3a1
A = [1 1 1 1 1;
    1/2 1/2 2 2 0;
    1/6 -1/6 4/3 -4/3 0;
    1/24 1/24 2/3 2/3 0;
    1/120 -1/120 32/120 -32/120 0];
b = zeros(5,1);
x = A\b
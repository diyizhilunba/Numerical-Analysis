%% Question h for problem 3
% parameters
f = @(x) -4 + 3*x - 2*x^2 + x^3; % The original function
v = [-4;
    3;
    -2;
    1]; % The coefficient vector
D = [0 1 0 0;
    0 0 2 0;
    0 0 0 3];% The differentiation matrix
e = ones(3,1); 

% calculate f'(1)
d = (e.' * D).';
df1 =  d.' * v;
disp("The result of f'(1) withou noise is :  ");
disp(df1);

% add some noise
v = v+ eps*rand(4,1); % add noise
d = (e.' * D).';
df1 =  d.' * v;
disp("The result of f'(1) with noise is:  ");
disp(df1);


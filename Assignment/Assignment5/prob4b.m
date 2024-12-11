% preparations
n = 40; % given n
a = -1;
b = 1;

f = @(x) exp(-10 * x.^2); % given function
df = @(x) -20 * x.* exp(-10 * x.^2); % derivative of f also given by problem



cheb_nodes_vector = cos( (2*(0:n-1)'+1) / (2*n)*pi); % generate chebyshev nodes
D_vv = chebdiff(n); % create a differentation matrix based on our given n
                 % using the function we wrote in part a)
                  


f_cheb = f(cheb_nodes_vector); % evaluate f at chebyshev nodes

                               % f_cheb looks like [f(x1), f(x2), f(x3),
                               % ...]

dp_cheb = D_vv * f_cheb; % our D_vv matrix is applied to a vector of values of f at cheb nodes

                                 % we return a vector of derivatives of p(x), p'(x), evaluated at
                                 % those chebyshev nodes ----> dp_cheb
                                 % ie dp_cheb looks like [p'(x0), p'(x1),p'(x2),...]

                                 % this is an APPROXIMATION of f'(x) evaluated at
                                 % chebyshev nodes
 




% evaluating the interpolant --- drawing out p_df(x)
x_dense = linspace(a,b,1000)'; % creating our dense grid
cheb_weights_vector = (-1).^(0:n-1)'.*sin((2*(0:n-1)'+1)/(2*n)*pi); % generate the weights
p_df = zeros(1000,1); % initializing the container to store interpolant (aka p(x)) outputs
for k = 1:1000
     p_df(k) = baryinterp(x_dense(k),cheb_nodes_vector,dp_cheb,cheb_weights_vector); % use given baryinterp function
end
% the derivative of f, df, is another function
% p_df is a polynomial that interpolates this function df




df_exact = df(x_dense); % evaluating our derivative on dense grid exactly



% plotting

subplot(2, 1, 1); % first plot
plot(x_dense, df_exact, '-', 'DisplayName', 'Exact','LineWidth',4); hold on;  % plotting the exact derivative

plot(x_dense, p_df,'.-', 'DisplayName', 'Interpolant');  % plotting the interpolant

legend show;
title('Derivative Approximation');
xlabel('x'); 
ylabel('f''(x)');
hold off


subplot(2, 1, 2); % Second panel
abs_error = abs(p_df - df_exact);
semilogy(x_dense, abs_error, '-'); % plotting error
title('Absolute Error of Derivative Interpolant');
xlabel('x');
ylabel('Absolute Error');
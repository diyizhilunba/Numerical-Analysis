relative_err = zeros(14, 1);
cond_num = zeros(14, 1);
relative_residual_err = zeros(14, 1);
count = 1:14;
epsilon = eps;
rela_err_con = @(x) x .* epsilon;

for n = 2:15
    exact_sol = ones(n, 1);

    matrix = hilb(n); 

  
    b = sum(matrix, 2);

   
    cond_num(n-1) = cond(matrix);
    fprintf('The condition number = %.20f\n', cond_num(n-1))

  
    [x] = gausselim_wyb(matrix, b); 

    relative_err(n-1) = norm(x - exact_sol) / norm(exact_sol);
    fprintf('The relative error = %.20f\n', relative_err(n-1))

   
    relative_residual_err(n-1) = norm(matrix * x - b) / norm(b);
    disp("relative residue error");
    disp(relative_residual_err(n-1))
end

semilogy(count, relative_err, '.-', 'Color', 'r'); hold on;
semilogy(count, rela_err_con(cond_num), '.-', 'Color', 'b');
semilogy(count, relative_residual_err, '.-', 'Color', 'g');
xlabel('Matrix size n');
ylabel('Error');
legend('Relative Error', 'Condition Number Bound', 'Relative Residual Error');


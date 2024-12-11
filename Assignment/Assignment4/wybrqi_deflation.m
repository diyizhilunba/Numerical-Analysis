function [e_val, e_vec] = rqi_deflation(A, tol, max_iter)

    n = length(A);
    e_val = zeros(n, 1); % vec to store eigenvalues
    e_vec = zeros(n, n); %mat to store eigenvectors
    
    column_count = 1;  % count to go through all col of matrix
    
    while column_count <= n
        %initialization
        v = rand(n, 1);       % random vec
        v = v / norm(v);      % normalize
        lambda = (v' * A * v) / (v' * v);  % lambda from Rayleigh quotient
        
        % set up 
        prev_lambda = inf;
        diff = inf;
        iter_count = 0;
        
        while diff > tol && iter_count < max_iter
            iter_count = iter_count + 1;
            
            % (A - lambda*I)y = v
            y = (A - lambda * eye(n)) \ v; 
            v = y / norm(y);  
            
            % re-orthogonalize 
            for j = 1:column_count-1
                v = v - ( e_vec(:, j)' * v) * e_vec(:, j);
            end
            v = v / norm(v); 
            
            % new e_val
            lambda_new = (v' * A * v) / (v' * v);
            
            % calculate err
            diff = abs(lambda_new - prev_lambda);
            prev_lambda = lambda_new;
            
            %new lanbda
            lambda = lambda_new;
        end
        
        % Check max iter
        if iter_count == max_iter
            fprintf('Rayleigh Quotient Iteration did not converge for eigenpair %d within %d iterations', column_count, max_iter);
        end
        
        % store e-val and e-vec
        e_val(column_count) = lambda;
        e_vec(:, column_count) = v;
        
        % deflation
        A = A - lambda * (v * v'); 
        
        column_count = column_count + 1;
    end
end

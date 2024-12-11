function [eval, evec] = rqi_deflation(A, tol, max_iter)
n = length(A);
eval = zeros(n,1);
evec = zeros(n,n);
col = 1;
while col <= n
    %calculate the epair
    % starting point
    w = rand(n,1);
    y = w/norm(w);
    lambda = y' * A * y;
    diff = tol+1;
    niter = 0;
    while (diff > tol) && (niter < max_iter)
        prev_y = y;
        niter = niter + 1;
        yhat = (A-lambda * eye(n))\y;
        if(yhat(1,1) * y(1,1) < 0)
            yhat = -yhat;
        end
        y = yhat/norm(yhat);
        % re-orthogonalize 
        for j = 1:col-1
            y = y - (evec(:, j)' * y) * evec(:, j);
        end
        y = y / norm(y); 
        lambda = y' * A * y;
        % calculate err
        diff = norm(prev_y-y);
        
            
        
    end
    % Check max iter
        if niter == max_iter
            error("Reach maximum iteration number, did not converge")
        end
        % store e-val and e-vec
        eval(col) = lambda;
        evec(:, col) = y;
        
        % deflation
        A = A - lambda * (y * y'); 
        
        col = col + 1;

end

end


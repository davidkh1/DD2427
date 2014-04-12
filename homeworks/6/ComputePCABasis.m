function [mu, w, D] = ComputePCABasis(X)
%COMPUTEPCABASIS Compute the eigenfaces 

    % compute the mean of all the faces
    mu = mean(X, 2);

    % subtract the mean from each face
    X = X - repmat(mu, 1, size(X,2));
    
    % if the vector length is very large, use an alternate way of computing
    % eigenvectors
    if (size(X,1) > size(X,2))
        C = (1/size(X,2)) * X' * X;
        % cols of vec are eigenvectors, diagonal of val is eigenvalues
        [vec, val] = eig(C);
        D = diag(val);
        w = X * vec;
    else
        C = (1/size(X,2)) * X * X';
        [w, val] = eig(C);
        D = diag(val);
    end
    
    norms = sqrt(sum(w.^2,1));
    w = w ./ repmat(norms, size(X,1), 1);
    
end
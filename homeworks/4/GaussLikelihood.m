function lvals =  GaussLikelihood(xs, mean, covar)
%GAUSSLIKELIHOOD
    
    % dimensionality of the vector
    d = size(xs,2);
    n = size(xs,1);
    % distance between a given point and the mean point computed from the
    % training data
    dist = (xs - repmat(mean, size(xs, 1), 1));
    cinv = inv(covar);  
    lvals = zeros(n,1);
    
    normaliser = 1/((2*pi)*(d/2)*sqrt(det(covar)));
    % could simplify this significantly
    for i=1:n
        lvals(i,:) = normaliser * exp(-0.5*dist(i,:)*cinv*dist(i,:)');
    end
end


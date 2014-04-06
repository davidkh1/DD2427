function loglvals = GaussLogLikelihood(xs, mean, covar)
%GAUSSLOGLIKELIHOOD Summary of this function goes here
%   Detailed explanation goes here
    
    % dimensionality of the vector
    d = size(xs,2);
    n = size(xs,1);
    % distance between a given point and the mean point computed from the
    % training data
    dist = (xs - repmat(mean, size(xs, 1), 1));
    cinv = inv(covar);  
    loglvals = zeros(n,1);

    % computation with logs
    normaliser = -(d/2)*log(2*pi)-(1/2)*log(det(covar));
    % could simplify this significantly
    for i=1:n
        loglvals(i,:) = normaliser + -0.5*dist(i,:)*cinv*dist(i,:)';
    end
end


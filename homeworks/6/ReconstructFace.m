function rim = ReconstructFace(im, mu, W, w, h, N)
% RECONSTRUCTFACE reconstruct im using N eigenfaces defined by mu and W. w
% and h define the size of the images used to construct the eigenfaces.

    res = imresize(im, [h w]);
    res = res(:);
    
    % normalise the face
    rmean = mean(res);
    rstd = std(res);
    res = (res - rmean)/rstd;
    res = res - mu;
    
    % project the normalised image minus the mean of the faces
    % onto each of the N eigenvectors
    rim = zeros(size(res));
    for i=1:N
        rim = rim + dot(W(:,i), res) * W(:,i);
    end
    
    % reverse the normalisation and resize the image to the size of the
    % original
    rim = rim + mu;
    rim = (rim + rmean) * rstd;
    rim = reshape(rim, h, w);
    rim = imresize(rim, [size(im,1) size(im,2)]);
    
end


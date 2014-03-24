function [pim] = protan(original)
%PROTAN Summary of this function goes here
%   Detailed explanation goes here
    % constants to use for colour domain shrinking
    proportion = 0.992052;
    addition = 0.003974;
    
    % LMS colour system transform matrix
    M = [17.8824 43.5161 4.11935;
         3.45565 27.1554 3.86714;
         0.0299566 0.184309 1.46709];
    % projection matrix to dichromat domain
    P = [0 2.02344 -2.52581;
         0 1 0;
         0 0 1];


    % put the RGB values into vectors after extracting them 
    R = double(original(:,:,1));
    R = R(:)';
    G = double(original(:,:,2));
    G = G(:)';    
    B = double(original(:,:,3));
    B = B(:)';
   
    agg = [R;G;B];
    
    agg = proportion * ((agg/255).^2.2) + addition;
       
    % back to RGB space, still need to reverse the transform. This applies
    % the projection matrix to each individual transformed RGB pixel
    % (hopefully)
    rgbpre = M\P*M * agg;
    
    rgb = round(255*(rgbpre.^(1/2.2)));
    
    % extract the long row vectors for RGB and reshape them to the original
    % image dimensions
    pim = zeros(size(original));
    pim(:,:,1) = reshape(rgb(1,:), size(original,1), size(original,2));
    pim(:,:,2) = reshape(rgb(2,:), size(original,1), size(original,2));
    pim(:,:,3) = reshape(rgb(3,:), size(original,1), size(original,2));
end


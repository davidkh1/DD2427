function [pim, dim] = MakeDichromatIms(original)
%MAKEDICHROMATIMS Summary of this function goes here
%   Detailed explanation goes here
    dprop = 0.957237;
    dadd = 0.0213814;
    pprop = 0.992052;
    padd = 0.003974;
    
    % LMS colour system transform matrix
    M = [17.8824 43.5161 4.11935;
         3.45565 27.1554 3.86714;
         0.0299566 0.184309 1.46709];
     
    % projection matrix to dichromat domain for deutanopes
    dP = [1 0 0;
         0.494207 0 1.24827;
         0 0 1];


    % projection matrix to dichromat domain for protanopes
    pP = [0 2.02344 -2.52581;
         0 1 0;
         0 0 1];

         % put the RGB values into vectors after extracting them 
    R = double(original(:,:,1));
    R = R(:)';
    G = double(original(:,:,2));
    G = G(:)';    
    B = double(original(:,:,3));
    B = B(:)';
   
    % aggregate the RGB values into a matrix of 3*P where P=xpixels*ypixels
    agg = [R;G;B];
    
    aggdeut = dprop * ((agg/255).^2.2) + dadd;
    aggprot = pprop * ((agg/255).^2.2) + padd;
       
    % back to RGB space, still need to reverse the transform. This applies
    % the projection matrix to each individual transformed RGB pixel
    % (hopefully)
    rgbpreprot = M\pP*M * aggprot;
    rgbpredeut = M\dP*M * aggdeut;
    
    rgbprot = round(255*(rgbpreprot.^(1/2.2)));
    rgbdeut = round(255*(rgbpredeut.^(1/2.2)));
    
    % extract the long row vectors for RGB and reshape them to the original
    % image dimensions
    dim = zeros(size(original));
    dim(:,:,1) = reshape(rgbdeut(1,:), size(original,1), size(original,2));
    dim(:,:,2) = reshape(rgbdeut(2,:), size(original,1), size(original,2));
    dim(:,:,3) = reshape(rgbdeut(3,:), size(original,1), size(original,2));
    
    pim = zeros(size(original));
    pim(:,:,1) = reshape(rgbprot(1,:), size(original,1), size(original,2));
    pim(:,:,2) = reshape(rgbprot(2,:), size(original,1), size(original,2));
    pim(:,:,3) = reshape(rgbprot(3,:), size(original,1), size(original,2));
    
     
end


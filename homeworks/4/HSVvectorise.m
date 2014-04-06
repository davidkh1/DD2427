function [ hsvvecs ] = HSVvectorise(im)
%HSVVECTORISE take a 3D image matrix and make it into a hsv image,
%converting hue values into sin and cos components, resultin in a 4-dim
%vector representing a pixel
    hsvim = rgb2hsv(im);
    modim(:,:,1) = cos(hsvim(:,:,1));
    modim(:,:,2) = sin(hsvim(:,:,1));
    modim(:,:,3:4) = hsvim(:,:,2:3);
    
    hsvvecs = double(reshape(modim, [size(modim,1)*size(modim,2) 4]));
end


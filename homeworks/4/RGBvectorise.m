function rgbvecs = RGBvectorise(im)
%RGBVECTORISE take a 3D image matrix and make it so each channel is a
%column vector. This means that each row is an RGB pixel
    rgbvecs = double(reshape(im, [size(im,1)*size(im,2) 3]));
end


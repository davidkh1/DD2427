function ExtractPlotSift(imFile)
%EXTRACTPLOTSIFT Summary of this function goes here
%   Detailed explanation goes here

col_im = imread(imFile);
im = single(rgb2gray(col_im));
im = (im - mean(im(:)))/std(im(:));
w = size(im,1);
sc = (w-2)/12;
% feature frame with x, y representing centre, scale, and orientation in radians
fc = [w/2; w/2; sc; 0];

[fc fs] = vl_sift(im, 'frames', fc);
fs = double(fs(:));
stem(fs)
image(col_im)
vl_plotframe(fc(:))
vl_plotsiftdescriptor(fs(:), fc(:))
end


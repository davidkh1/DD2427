function fs = ExtractSiftDescriptor(im)
%EXTRACTSIFTDESCRIPTOR Summary of this function goes here
%   Detailed explanation goes here
w = size(im,1);
sc = (w-2)/12;
% feature frame with x, y representing centre, scale, and orientation in radians
fc = [w/2; w/2; sc; 0];

[fc fs] = vl_sift(im, 'frames', fc);
fs = double(fs(:));

end


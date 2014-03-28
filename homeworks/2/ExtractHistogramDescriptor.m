function hs = ExtractHistogramDescriptor(im, bins)
%EXTRACTHISTOGRAMDESCRIPTOR Summary of this function goes here
%   Detailed explanation goes here
[hs, xx] = hist(im(:), bins);
hs = hs(:)/sum(hs);
end


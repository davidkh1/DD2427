function [fs] = ExtractGridHistogram(im, ng, bins)
%EXTRACTGRIDHISTOGRAM Summary of this function goes here
%   Detailed explanation goes here

xs = floor(linspace(1, size(im, 2) + 1, ng + 1));
ys = floor(linspace(1, size(im, 1) + 1, ng + 1));

fs = zeros(1, bins*ng*ng);
count = 0;
for i=1:ng
    ii = xs(i):xs(i+1)-1;
    for j=1:ng
        jj = ys(j):ys(j+1)-1;
        %Extract image patch defined by ii and jj
        patch = im(jj,ii);
        %Compute histogram of the patch’s pixel intensities
        hst = hist(patch(:),bins);
        %Normalize the histogram
        hst = hst(:)/sum(hst);
        %Concatenate this histogram to fs
        starti = count*bins+1;
        endi = (count+1)*bins;
        fs(starti:endi) = hst;
        
        count = count + 1;
    end
end

fs = fs';

end


function ComputeDescriptorDistances(in_dir, nbins, nsegments, out_prefix)
%COMPUTEDESCRIPTORDISTANCES Summary of this function goes here
%   Detailed explanation goes here
dnames = {'Template','Histogram','GridHistogram','SIFT'};

Fs = ComputeDescriptors(in_dir,nbins,nsegments);
for i = 1:4
    figure
    a = ComputeDistanceMatrix(Fs{i});
    im = mat2gray(a);
    imshow(im);
    imwrite(im, [out_prefix '_' dnames{i} '.png']);
end

end


function Fs = ComputeDescriptors(DirName, nbins, ng)
%COMPUTEDESCRIPTORS Summary of this function goes here
%   Detailed explanation goes here

mystr = [DirName, '/*.png'];
im_files = dir(mystr);
ni = length(im_files);
ims = cell(1, ni);
addpath(DirName);
for i=1:ni
    col_im = imread(im_files(i).name);
    im = single(rgb2gray(col_im));
    ims{i} = (im - mean(im(:)))/ std(im(:));
end

Fs = cell(1,4);

for i=1:ni
    % template
    Fs{1} = [Fs{1} ims{i}(:)];
    % histogram
    Fs{2} = [Fs{2} ExtractHistogramDescriptor(ims{i}, nbins)];
    % grid histogram
    Fs{3} = [Fs{3} ExtractGridHistogram(ims{i}, ng, nbins)];
    % sift
    Fs{4} = [Fs{4} ExtractSiftDescriptor(ims{i})];
end

end


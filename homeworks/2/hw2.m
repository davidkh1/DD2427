%% extracting template descriptor
close all;
col_im = imread('pics/Aligned_Pics/eye001.png');
im = single(rgb2gray(col_im));
im = (im - mean(im(:)))/std(im(:));

fs = im(:);
stem(fs(1:10:end))

%% computing histogram of pixel intensities
close all;
col_im = imread('pics/Aligned_Pics/eye001.png');
im = single(rgb2gray(col_im));
im = (im - mean(im(:)))/std(im(:));

nbins = 30;
[fs, xx] = hist(im(:), nbins);
fs = fs(:)/sum(fs);
stem(xx,fs);

%% ng x ng grid of histograms

close all;
col_im = imread('pics/Aligned_Pics/eye001.png');
im = single(rgb2gray(col_im));
im = (im - mean(im(:)))/std(im(:));

nbins = 30;
ng = 2;

% get the indices required to split the image into ng rows and columns
xs = floor(linspace(1, size(im, 2) + 1, ng + 1));
ys = floor(linspace(1, size(im, 1) + 1, ng + 1));

ii = xs(1):xs(2)-1;
jj = ys(1):ys(2)-1;
pim = im(jj, ii);
[fs,xx] = hist(pim(:), nbins);
fs = fs(:)/sum(fs);

bar(xx,fs)

%% test extraction of grid histogram
close all;
col_im = imread('pics/Aligned_Pics/eye001.png');
im = single(rgb2gray(col_im));
im = (im - mean(im(:)))/std(im(:));

fs = ExtractGridHistogram(im, 2, 30);

figure
stem(fs);

%% sift descriptor
close all;
col_im = imread('pics/Aligned_Pics/eye001.png');
im = single(rgb2gray(col_im));
im = (im - mean(im(:)))/std(im(:));
w = size(im,1);
sc = (w-2)/12;
% feature frame with x, y representing centre, scale, and orientation in radians
fc = [w/2; w/2; sc; 0];

[fc fs] = vl_sift(im, 'frames', fc);
fs = double(fs(:));
stem(fs)
figure
image(col_im)
vl_plotframe(fc(:))
vl_plotsiftdescriptor(fs(:), fc(:))
%%
close all;
ExtractPlotSift('pics/Aligned_Pics/eye001.png')

%% computing all descriptors for directory of images
close all;
Fs = ComputeDescriptors('pics/Aligned_Pics',30,2);

%% testing the distance matrix computations
close all;
Fs = ComputeDescriptors('pics/Aligned_Pics',30,2);
for i = 1:4
    figure
    a = ComputeDistanceMatrix(Fs{i});
    im = mat2gray(a);
    imshow(im);
end

%% saving results of distance computations
close all;
ComputeDescriptorDistances('pics/Aligned_Pics', 30, 2, 'results/dmat_align');
ComputeDescriptorDistances('pics/Misaligned_Pics', 30, 2, 'results/dmat_misalign');
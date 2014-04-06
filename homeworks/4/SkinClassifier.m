function classim = SkinClassifier(imorig)
%SKINCLASSIFIER classifies pixels in the image as skin or non-skin based on
%previously computed skin and background representations. 
%   Detailed explanation goes here

bgmu = [101.3548   97.0391   85.8162];
bgsigma = 1000 * [5.2418    4.5354    4.1368; 4.5354    4.6192    4.3836; 4.1368    4.3836    4.8574];
mu = [176.6303  128.8086  103.7527];
sigma =  1000 * [1.7206    1.4262    1.4428; 1.4262    1.4197    1.4444; 1.4428    1.4444    1.5887];

im = RGBvectorise(imorig);

bglvals = GaussLikelihood(im,bgmu,bgsigma);
im_bglvals = reshape(bglvals, size(imorig,1), size(imorig,2));

lvals = GaussLikelihood(im, mu, sigma);
% normalise the probabilities to display as an image
im_lvals = reshape(lvals, size(imorig,1), size(imorig,2));

lrat = im_lvals./im_bglvals;
figure
imshow(lrat)
figure
imshow(lrat>1)

classim = lrat>1;


end


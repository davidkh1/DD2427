%% testing image centre extraction
close all;
figure
im = imread('BackgroundImages/Forest2.jpg');
imshow(im);
figure
imcentre = GrabCentrePixels('BackgroundImages/Forest2.jpg', 0.1);
imshow(imcentre);

%% testing colour model training
close all

TrainColourModel('BushImages',20,0.2);

%% testing application of the gaussian likelihood computation to an image
close all;

% the test image
imorig = imread('../1/pics/bike_small.jpg');
testim = RGBvectorise(imorig);
% train colour model on pictures of bush
[mu, sigma] = TrainColourModel('BushImages',20,0.2);
% find the likelihood of pixels in the test image being skin pixels
lvals = GaussLikelihood(testim, mu, sigma);
% normalise the probabilities to display as an image
im_lvals = reshape(lvals, size(imorig,1), size(imorig,2))/max(lvals);
figure
imshow(im_lvals)

%% test hsv conversion

testim = HSVvectorise(imread('../1/pics/bike_small.jpg'));
[mu, sigma] = TrainColourModel('BushImages',20,0.2,'hsv');
size(testim)
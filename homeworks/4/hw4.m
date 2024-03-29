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
TrainColourModel('BackgroundImages',0,1);

%% testing application of the gaussian likelihood computation to an image
% hsv and RGB
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

testimhsv = HSVvectorise(imread('../1/pics/bike_small.jpg'));
[muhsv, sigmahsv] = TrainColourModel('BushImages',20,0.2,'hsv');
% find the likelihood of pixels in the test image being skin pixels
lvalshsv = GaussLikelihood(testimhsv, muhsv, sigmahsv);
% normalise the probabilities to display as an image
im_lvalshsv = reshape(lvalshsv, size(imorig,1), size(imorig,2))/max(lvalshsv);
figure
imshow(im_lvalshsv)

%% test background pixel computations
close all;
testim = RGBvectorise(imread('../1/pics/bike_small.jpg'));
[bgmu, bgsigma] = TrainColourModel('BackgroundImages',0,1);
lvals = GaussLikelihood(testim,bgmu,bgsigma);
im_lvals = reshape(lvals, size(imorig,1), size(imorig,2))/max(lvals);
figure
imshow(im_lvals)

testimhsv = HSVvectorise(imread('../1/pics/bike_small.jpg'));
[bgmuhsv, bgsigmahsv] = TrainColourModel('BackgroundImages',0,1,'hsv');
lvalshsv = GaussLikelihood(testimhsv,bgmuhsv,bgsigmahsv);
im_lvalshsv = reshape(lvalshsv, size(imorig,1), size(imorig,2))/max(lvalshsv);
figure
imshow(im_lvalshsv)

%% test rgb image classification and likelihood ratio
close all;
testim = RGBvectorise(imread('../1/pics/bike_small.jpg'));
[bgmu, bgsigma] = TrainColourModel('BackgroundImages',0,1);
bglvals = GaussLikelihood(testim,bgmu,bgsigma);
im_bglvals = reshape(bglvals, size(imorig,1), size(imorig,2));
figure
imshow(im_bglvals/max(bglvals))

% train colour model on pictures of bush
[mu, sigma] = TrainColourModel('BushImages',20,0.2);
% find the likelihood of pixels in the test image being skin pixels
lvals = GaussLikelihood(testim, mu, sigma);
% normalise the probabilities to display as an image
im_lvals = reshape(lvals, size(imorig,1), size(imorig,2));
figure
imshow(im_lvals/max(lvals))

lrat = im_lvals./im_bglvals;
figure
imshow(lrat)
figure
imshow(lrat>1)

%% test hsv image classification and likelihood ratio
close all;
testim = HSVvectorise(imread('../1/pics/bike_small.jpg'));
[bgmu, bgsigma] = TrainColourModel('BackgroundImages',0,1,'hsv');
bglvals = GaussLikelihood(testim,bgmu,bgsigma);
im_bglvals = reshape(bglvals, size(imorig,1), size(imorig,2));
figure
imshow(im_bglvals/max(bglvals));

% train colour model on pictures of bush
[mu, sigma] = TrainColourModel('BushImages',20,0.2,'hsv');
% find the likelihood of pixels in the test image being skin pixels
lvals = GaussLikelihood(testim, mu, sigma);
% normalise the probabilities to display as an image
im_lvals = reshape(lvals, size(imorig,1), size(imorig,2));
figure
imshow(im_lvals/max(lvals));

lrat = im_lvals./im_bglvals;
figure
imshow(lrat)
figure
imshow(lrat>1)

%% student image test
close all;
testim = imread('StudentImages/Student2.jpg');
class = SkinClassifier(testim);
[compx compy] = FindBiggestComp(class)
% x y w h
rect = [compx(1) compy(1) compx(3)-compx(1) compy(3)-compy(1)]
detected = insertShape(testim,'Rectangle',rect,'Color','red');
figure
imshow(detected)
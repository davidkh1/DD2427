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
testim = RGBvectorise(imread('../1/pics/bike_small.jpg'));
% train colour model on pictures of bush
[mu, sigma] = TrainColourModel('BushImages',20,0.2);

%% test hsv conversion

testim = HSVvectorise(imread('../1/pics/bike_small.jpg'));
[mu, sigma] = TrainColourModel('BushImages',20,0.2,'hsv');
size(testim)
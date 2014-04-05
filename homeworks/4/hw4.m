%% testing image centre extraction
close all;
figure
im = imread('BackgroundImages/Forest2.jpg');
imshow(im);
figure
imcentre = GrabCentrePixels('BackgroundImages/Forest2.jpg', 0.5);
imshow(imcentre);
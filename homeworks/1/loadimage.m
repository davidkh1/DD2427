function [img] = loadimage(image_name)
%LOADIMAGE Summary of this function goes here
%   Detailed explanation goes here
    img = imread(image_name);
    imagesc(img);
    axis equal;
end


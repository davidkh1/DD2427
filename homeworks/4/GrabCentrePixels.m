function cim = GrabCentrePixels(im_fname, p)
%GRABCENTREPIXELS Summary of this function goes here
%   Detailed explanation goes here
    im = imread(im_fname);
    height = size(im, 1);
    width = size(im, 2);
    centrey = floor(height/2);
    centrex = floor(width/2);

    grabheight = floor(p * height);
    grabwidth = floor(p * width);
    
    topleftx = ceil(centrex - grabwidth/2) + 1;
    toplefty = ceil(centrey - grabheight/2) + 1;
    botrightx = topleftx + grabwidth - 1;
    botrighty = toplefty + grabheight - 1;

%     figure
%     imshow(im)
%     hold on;
%     plot(topleftx, toplefty, 'gx','linewidth',2,'markersize',12)
%     plot(botrightx, botrighty, 'ro','linewidth',2,'markersize',12)

    cim = im(toplefty:botrighty, topleftx:botrightx, :);

end


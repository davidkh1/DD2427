function [X, w, h] = LoadData(dir, pw, ph, n)
%LoadData load data for the first n images from the given directory by extracting some
%proportion of the image at its centre. pw is the width proportion and ph
%the height. X contains the resulting images, and w and h are the original
%image width and height.

    dirIm = ListDirImages(dir);
    if (n == 0)
        n = size(dirIm,1);
    end
    X = [];
    w = [];
    h = [];
    for i=1:n
        im = imread(dirIm{i});
        height = size(im, 1);
        width = size(im, 2);
        centrey = floor(height/2);
        centrex = floor(width/2);

        grabheight = floor(ph * height);
        grabwidth = floor(pw * width);

        topleftx = ceil(centrex - grabwidth/2) + 1;
        toplefty = ceil(centrey - grabheight/2) + 1;
        botrightx = topleftx + grabwidth - 1;
        botrighty = toplefty + grabheight - 1;

%         figure
%         imshow(im)
%         hold on;
%         plot(topleftx, toplefty, 'gx','linewidth',2,'markersize',12)
%         plot(botrightx, botrighty, 'ro','linewidth',2,'markersize',12)

        cim = im(toplefty:botrighty, topleftx:botrightx, :);
        gry = cim;
        if (ndims(gry) > 2)
            gry = rgb2gray(cim);
        end
        gry = double(gry(:));
        gry = (gry - mean(gry))/std(gry);
        
%         figure
%         disp = reshape(gry, size(cim,1), size(cim,2));
%         imshow(disp)
         
        X = [X gry];
        h = [h size(cim,1)];
        w = [w size(cim,2)];
    end

end


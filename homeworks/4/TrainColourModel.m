function [ mu, sigma ] = TrainColourModel(im_dir, n_ims, centre_prop, cmodel)
%TRAINCOLOURMODEL Train a colour model on n_ims of the images in im_dir, 
% using pixels from a proportion centre_prop of the centre of the image.
% cmodel indicates whether to use an RGB model or a HSV model to train. If
% nothing is given, then RGB is assumed - options are rgb or hsv

    if nargin < 4
        cmodel = 'rgb';
    end

    allims = ListDirImages(im_dir);
    ims = allims(1:n_ims);
    mat = [];

    if strcmp(cmodel,'rgb')
        for i=1:n_ims
            fname = strcat(im_dir, '/', ims{i});
    %         figure
            cpix = RGBvectorise(GrabCentrePixels(fname, centre_prop));
    %         imshow(cpix)
            mat = [mat ; cpix];
        end
    elseif strcmp(cmodel, 'hsv')
        for i=1:n_ims
            fname = strcat(im_dir, '/', ims{i});
            %         figure
            cpix = HSVvectorise(GrabCentrePixels(fname, centre_prop));
            %         imshow(cpix)
            mat = [mat ; cpix];
        end
    end
    mat = double(mat);
    
    mu = mean(mat);
    sigma = cov(mat);
end


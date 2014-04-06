% putting things on the grayscale image
close all;
img = showimage('pics/bike_small_gray.jpg');
colormap('gray')
hold on;

% one of the two arrays should have identical values
xvals = [350,350];
yvals = [300,450];
plot(0,147,'gx','linewidth',2,'markersize',12)
plot(xvals, yvals, 'b', 'LineWidth', 2)
ylist = yvals(1):yvals(2);
intensities = img(ylist, xvals(1));

figure
plot(ylist,intensities)

% column wise expansion into the vector
%ii = size(im, 1)*(x-1) + y to extract the pixel intensity at x,y
pixels = img(:);
disp([size(pixels)])
disp(size(img,1)*size(img,2))

indices = size(img,1)*(xvals(1)-1) + ylist;
vecint = pixels(indices);
figure
plot(ylist, vecint)

% reshape the vector to the same shape as the original image
orig = reshape(pixels, size(img,1), size(img,2));
size(orig)

%% colour image
close all
img = showimage('pics/Flowers.jpg');
ndims(img)
size(img)

R = double(img(:,:,1));
G = double(img(:,:,2));
B = double(img(:,:,3));

figure
montage({R,G,B}, 'size',[1,3])

%% testing the image modifier for the deutan
close all
img = showimage('pics/FireEngine.jpg');
dimg = deutan(img);
figure
imagesc(dimg/255)

%% testing the image modifier for the protan
close all
img = showimage('pics/FireEngine.jpg');
pimg = protan(img);
figure
imagesc(pimg/255)

%% testing full function (trivial)
close all
img = showimage('pics/Flowers.jpg');
[pim, dim] = MakeDichromatIms(img);
montage({img, pim/255, dim/255}, 'size', [1 3])
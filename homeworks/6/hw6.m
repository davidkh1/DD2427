%% loading training data
close all;
[X evec h] = LoadData('homeworks/4/BushImages', 0.33, 0.5, 0);

%% computing eigenfaces
close all;
[X w h] = LoadData('homeworks/4/BushImages', 0.33, 0.5, 0);
[mu, evec, eval] = ComputePCABasis(X);

% display some of the eigenfaces
nfaces = 10;
facecell = cell(1,nfaces);
%facecell{1} = reshape(mu/max(mu),h(1),w(1));
for i=1:nfaces
    facecell{i} = reshape(evec(:,i)/max(evec(:,i)), h(1), w(1));
end

mymontage(facecell, 'size', [2 5])

% looking at the eigenvalues
tind = EigenPlot(eval, 0.9);

%% face reconstruction

close all;
[X w h] = LoadData('homeworks/6/ADAFACES', 1, 1, 3000);
[mu, evec, eval] = ComputePCABasis(X);

figure
imagesc(reshape(mu, w(1), h(1)));
axis equal
colormap('gray')
% display some of the eigenfaces
nfaces = 10;
facecell = cell(1,nfaces);
%facecell{1} = reshape(mu/max(mu),h(1),w(1));
for i=1:nfaces
    facecell{i} = reshape(evec(:,i)/max(evec(:,i)), h(1), w(1));
end
figure
mymontage(facecell, 'size', [2 5])

% looking at the eigenvalues
tind = EigenPlot(eval, 0.9);



%% run the above first
close all;

% student face extraction
im = double(imread('homeworks/4/StudentImages/Student4.jpg'));
im = im(183:248, 297:362);

figure
imagesc(im);
colormap(gray)
axis equal

nvecs = [1 10 20 50 100 200 250];
recs = cell(1,size(nvecs,2)+1);
recs{1} = im./max(im(:));
for i = 2:size(recs,2)
    rf = ReconstructFace(im, mu, evec, w(1), h(1), nvecs(i-1));
    recs{i} = rf./max(rf(:));
end

for i = 1:size(recs,2)
    ShowIm(recs{i})
end
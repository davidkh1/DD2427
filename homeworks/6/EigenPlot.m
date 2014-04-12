function tindex = EigenPlot(evs, preserveprop)
%EIGENPLOT create a plot of the cumsum of the eigenvalues, and return the
%number of eigenvalues needed to preserve the given proportion of variation
%in the data.
evsum = cumsum(evs)/sum(evs);
thresh=find(evsum>preserveprop, 1, 'first');
figure
hold on
plot(1:size(evs,1),evsum)
line([0 thresh],[preserveprop preserveprop], 'color','r')
line([thresh thresh], [0, evsum(thresh)],'color','r')
axis([0 size(evs,1) 0 1])
tindex = thresh;
end


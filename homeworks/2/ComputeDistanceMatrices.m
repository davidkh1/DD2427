function dm = ComputeDistanceMatrices(descriptors)
%COMPUTEDISTANCEMATRICES 
% Compute the distance matrices for the cell array of descriptors given,
% which is the result of the ComputeDescriptors function. Returns a cell
% array containing distance matrices corresponding to each of the
% descriptor matrices

dm = cell(1,size(descriptors,2));
for i = 1:size(descriptors,2);
    dm{i} = ComputeDistanceMatrix(descriptors{i});
end

end


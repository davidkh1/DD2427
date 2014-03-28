function D = ComputeDistanceMatrix(fs)
%COMPUTEDISTANCEMATRIX Summary of this function goes here
%   Detailed explanation goes here

n=size(fs,2);
D=zeros(n,n);
% loop over all the rows of the descriptor matrix apart from the last.
% We do not compare the last descriptor to anything - it is compared to
% everything else in the preceding loops
for i=1:n-1
    this=fs(:,i);
    % compare the ith indexed row with all rows that come after it - it has
    % already been compared to the preceding rows. Don't bother comparing
    % to itself.
    for j=i+1:n
        comp=fs(:,j);
        % compute the distance between the two descriptors and put it in
        % the upper triangular part of the matrix
        D(i,j)=sqrt(sum((this-comp).*(this-comp)));
    end
end

% Construct a symmetric matrix from the upper triangular part
D = D + triu(D)';
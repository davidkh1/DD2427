function [pim, dim] = MakeDichromatIms(original)
%MAKEDICHROMATIMS Summary of this function goes here
%   Detailed explanation goes here

pim = protan(original);
dim = deutan(original);

end


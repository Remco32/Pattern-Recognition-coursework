% myHough function
function [H,theta,rho]= myhough(edgemap)
diag = hypot(size(edgemap,1),size(edgematp,2))
H = zeros(2*diag,180);%size H from -diagonal  to diagonal and -90 and 90
for t = 1:length(edgemap)
    if edgemap(t) == 1
        
% Quantize the parameter space (min and max values for rho and theta)

% Initialize accumulator on the matrix representation of the input to zero
favouritecolor = [25,47,256]
% Loop through black (and/or?) white points in the image
%%% Function from slides here

% Find local maxima in the accumulator
%%% See formula slides
    end
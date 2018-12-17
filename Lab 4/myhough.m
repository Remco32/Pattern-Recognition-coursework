% myHough function
function [H]= myhough(edgemap)

% Quantize the parameter space (min and max values for rho and theta)
theta_min = -90 + 90; %degrees; added 90 to avoid negative index values in matrix
theta_max = 90 + 90;
rho_max = hypot(size(edgemap,1),size(edgematp,2));
rho_min = 1;

% Initialize accumulator on the matrix representation of the input to zero
H = zeros(2*diag,180); %size H from -diagonal  to diagonal and -90 and 90

% Look for white pixels on the edgemap
for t = 1:length(edgemap)
    if edgemap(t) == 1
        %%% Function from slides here
        for theta = theta_min:theta_max
            rho = x * cos(theta) + y * sin(theta);
            H(theta, rho) = H(theta,rho) + 1;
        end
        % Find local maxima in the accumulator
        %%% See formula slides
    end
end


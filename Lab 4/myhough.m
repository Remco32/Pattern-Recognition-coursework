% myHough function
function [H]= myhough(edgemap)

% Quantize the parameter space (min and max values for rho and theta)
theta_min = -90 + 91; %degrees; added 90 to avoid negative index values in matrix
theta_max = 90 + 91;
rho_max = hypot(size(edgemap,1),size(edgemap,2));
%rho_min = 1;

% Initialize accumulator on the matrix representation of the input to zero
H = zeros(round(2*rho_max),180); %size H from -diagonal  to diagonal and -90 and 90

% Look for white pixels on the edgemap
for t = 1:size(edgemap,1)
    for s = 1:size(edgemap,2)
    if edgemap(t) == 1
        %%% Function from slides heredfg
        for theta = theta_min:theta_max
            rho = round(t * cos(theta) + s * sin(theta));
            H(theta, rho) = H(theta,rho) + 1;
        end
        % Find local maxima in the accumulator
        %%% See formula slides
    end
    end
end
H

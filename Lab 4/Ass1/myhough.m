% myHough function
function [H,rholist]= myhough(edgemap)

% Quantize the parameter space (min and max values for rho and theta)
theta_min = -90; %degrees; added 90 to avoid negative index values in matrix
theta_max = 90;
rho_max = abs(hypot(size(edgemap,1),size(edgemap,2)));
rho_min = 1;

% Initialize accumulator on the matrix representation of the input to zero
H = zeros(round(2*rho_max),181); %size H from -diagonal  to diagonal and -90 and 90
rholist = []
% Look for white pixels on the edgemap
for t = 1:size(edgemap,1)
    for s = 1:size(edgemap,2)
     
        if edgemap(s,t) == 1
            %%% Function from slides heredfg
            for theta = theta_min:theta_max
                rho = floor((t*cos(theta)+(s*sin(theta))));
           
                if rho == 0
                    rho = 1;
                end
                H(rho+362,theta+91) = H(rho+362,theta+91) + 1;
                
            end
            
        end

    end
            
end

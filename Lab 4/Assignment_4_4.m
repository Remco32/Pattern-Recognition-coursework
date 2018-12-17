c = imread('X:\My Documents\GitHub\Pattern-Recognition-coursework\Lab 4\HeadTool0002.bmp');
%c = double(c); % don't use double precision for adapthisteq. It does not
%like it (at least in v.2018b)
c = adapthisteq(c);
imshow(c)

[centers, radii, metric] = imfindcircles(c,[12,70],'ObjectPolarity','bright','Sensitivity',.86)
centersStrong7 = centers(1:7,:);
radiiStrong7 = radii(1:7);
metricStrong7 = metric(1:7);
%viscircles(centersStrong5, radiiStrong5,'Color','green') % disp circles


viscircles(centersStrong5(1:2,:), radiiStrong5(1:2),'Color','green')% strongest 2 circles
% c = imread('X:\My Desktop\PatRec\Cameraman.tiff'); 
c = imread('cameraman.tif'); 


edges = edge(c, 'canny');
[hc,rho] = myhough(edges);
%[hc,rho] = hough(edges);
imagesc(hc)
%plot(rho) 
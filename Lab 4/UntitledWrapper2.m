c = imread('X:\My Desktop\PatRec\Cameraman.tiff'); 


edges = edge(c, 'canny');
[hc,rho] = myhough(edges);
%[hc,rho] = hough(edges);
imagesc(hc)
%plot(rho) 
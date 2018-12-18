
c = imread('X:\My Desktop\PatRec\Cameraman.tiff'); 
edges = edge(c, 'canny');
[hc] = myhough(edges);
%[hc,rho] = hough(edges);

subplot(1,2,1)
imagesc(hc)
subplot(1,2,2)
[hc1] = hough(edges);
imagesc(hc1)
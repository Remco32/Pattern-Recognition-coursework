% c = imread('X:\My Desktop\PatRec\Cameraman.tiff'); 
c = imread('cameraman.tif'); 


edges = edge(c, 'canny');
hc = myhough(edges);
imagesc(hc)
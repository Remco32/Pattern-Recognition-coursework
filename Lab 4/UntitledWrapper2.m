c = imread('X:\My Desktop\PatRec\Cameraman.tiff'); 


edges = edge(c, 'canny');
hc = myhough(edges);
imagesc(hc)
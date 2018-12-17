c = imread('X:\My Desktop\PatRec\Cameraman.tiff'); 
imagesc(c)

edges = edge(c, 'canny');
hc = hough(edges);
imagesc(hc);
xlabel('?(degrees)')
ylabel('?')
title('s2568020')

%%
hcTh = hc;
hcTh(hcTh < 0.9 * max(hc(:))) = 0;
imagesc(hcTh)

%%
[H,T,R]= hough(edges)
P = houghpeaks(H, 5)
%H = imadjust(mat2gray(H))
figure1 = figure
ax = gca
%xlim(ax,[-90,90])
%ylim(ax,[0,700])
hold on
imagesc(H)
plot(T(P(:,2))+91,R(P(:,1))+724/2,'s','color','w')
xlabel('?(degrees)')
ylabel('?')
drawnow
%%
c = imread('X:\My Desktop\PatRec\Cameraman.tiff')
edges = edge(c, 'canny');
[H,T,R]= hough(edges)
P = houghpeaks(H, 1) %set n strongest lines à gusto
lines = houghlines(c,T,R,P,'FillGap',20,'MinLength',100)
imagesc(c)
hold on
theta = table2array(table(lines.theta)); rho = table2array(table(lines.rho));
for t = 1:max(size(theta))
myhoughline(c,rho(t),theta(t))
drawnow
end
title('s2568020')





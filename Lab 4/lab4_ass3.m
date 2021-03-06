I  = rgb2gray(imread('chess.jpg'));

BW = edge(I,'canny');
[H,T,R] = hough(BW);

P  = houghpeaks(H,15,'threshold',ceil(0.3*max(H(:))));

x = T(P(:,2));

y = R(P(:,1));





%H = imadjust(mat2gray(H))
figure1 = figure
ax = gca
%xlim(ax,[-90,90])
%ylim(ax,[0,700])
hold on
imagesc(H)
plot(T(P(:,2))+91,R(P(:,1))+975/2,'s','color','w')
xlabel('?(degrees)')
ylabel('?')
drawnow
%plot(x,y,'s','color','white');
%%

%Empty arrays
maxArray = [];
xArray = [];
yArray = [];

%N = 15; % Amount of points chosen
% Why can't we do this the easy way Matlab?
%for i = 1:N
%    maximum = max(max(H));
%    maxArray = [maxArray; maximum];
%    [x,y]=find(H==maximum);
%    
%    % For duplicates
%    x = x(1);
%    y = y(1);
%    
%    xArray(i) = x;
%    yArray(i) = y;
%    %Remove from array
%    H(x,y) = 0; 
%end

%%
%Scatterplot for Q3
scatter(xArray, yArray)

%%
%Plot img with top N lines
imshow(I)
hold on
%Plot lines
plot(xArray,yArray)


%%
lines = houghlines(I,T,R,P,'FillGap',20,'MinLength',100)
imshow(I)
hold on
theta = table2array(table(lines.theta)); rho = table2array(table(lines.rho));
for t = 1:max(size(theta))
myhoughline(I,rho(t),theta(t))
drawnow
end
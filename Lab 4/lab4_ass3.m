I  = rgb2gray(imread('chess.jpg'));

BW = edge(I,'canny');
[H,T,R] = hough(BW);

P  = houghpeaks(H,15,'threshold',ceil(0.3*max(H(:))));

x = T(P(:,2));

y = R(P(:,1));

%plot(x,y,'s','color','white');
%%

%Empty arrays
maxArray = [];
xArray = [];
yArray = [];

N = 15; % Amount of points chosen
% Why can't we do this the easy way Matlab?
for i = 1:N
    maximum = max(max(H));
    maxArray = [maxArray; maximum];
    [x,y]=find(H==maximum);
    
    % For duplicates
    x = x(1);
    y = y(1);
    
    xArray(i) = x;
    yArray(i) = y;
    %Remove from array
    H(x,y) = 0; 
end

%%
%Scatterplot for Q3
scatter(xArray, yArray)

%%
%Plot img with top N lines
imshow(I)
hold on
%Plot lines
plot(xArray,yArray)
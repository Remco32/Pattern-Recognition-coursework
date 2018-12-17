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

%for 1:size(H)
maximum = max(max(H))
maxArray = [maxArray; maximum] % for col array
[x,y]=find(H==maximum)
xArray = [xArray, x];
yArray = [yArray, y];
%Remove from array
H(x,y) = 0; % Why can't we do this the easy way Matlab?
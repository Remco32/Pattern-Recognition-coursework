

I = imread('dogGrayRipples.png');

I = im2double(I);

f = fft2(I); 

fs= fftshift(f);

f = abs(fs);

f = log(1+f);


imshow(f,[]);
[x, y] = getpts;

%%
r = 10
mask=zeros(size(f));
rows = size(f,1),cols = size(f,2),radius = r,center = [x'; y'];  
[xMat,yMat] = meshgrid(1:cols,1:rows);
for i =1:size(center,2) 
 distFromCenter = sqrt((xMat-center(1,i)).^2 + (yMat-center(2,i)).^2);
mask(distFromCenter<=radius)=1;
    
end
    figure, imshow(~mask,[]);title('Mask')

fs=fs.*(~mask); 
f = ifftshift(fs);
I = real(ifft2(f));
figure, imshow(I, []), title('Reconstructed');

    
    
 
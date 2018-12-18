c = imread('X:\My Documents\GitHub\Pattern-Recognition-coursework\Lab 4\dogGrayRipples.png');
cf=fft2(c);
cf2 = abs(cf);

subplot(2,2,1)
plot(cf2)

cf3 = cf;
cf3(247:280,:)=0
cf3(27:40,:)=0
subplot(2,2,2)
plot(abs(cf3))

subplot(2,2,3)
imshow(c)
subplot(2,2,4)

imshow(uint8(abs(ifft2(cf3))))

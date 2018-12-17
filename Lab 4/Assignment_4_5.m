[y,Fs]= audioread('X:\My Documents\GitHub\Pattern-Recognition-coursework\Lab 4\corrupted_voice.wav');
y1 = fft(y);


                   
T = 1/Fs;             % Sampling period       
t = (0:length(y)-1)*T;        % Time vector

P2 = abs(y1/length(y)); %double-sided spec
P1 = P2(1:length(y)/2+1);
P1(2:end-1) = 2*P1(2:end-1); %single sided spectrum with proper length

f = Fs*(0:(length(y)/2))/length(y)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|') % noise peaks at 100 and 6000 Hz

%% -> very experimental from here on
%[B,A] = butter(8,[5900,6100],'stop') 
%Y = filter(B,A,f)

f2 = bandstop(f,[.5800 .6200],Fs,'ImpulseResponse','iir','Steepness',0.95);
f3 = bandstop(f2,[.0080 .0120],Fs,'ImpulseResponse','iir','Steepness',0.95);

subplot(3,1,1)
plot(f,P1,'Color','r')
hold on
subplot(3,1,2)
plot(f2,P1,'Color','g')
subplot(3,1,3)
plot(f3,P1,'Color','b')
ax=gca
%xlim([0 8000])


ifft(f3)


[y,Fs]= audioread('X:\My Documents\GitHub\Pattern-Recognition-coursework\Lab 4\corrupted_voice.wav');
y1 = fft(y);
info =audioinfo('X:\My Documents\GitHub\Pattern-Recognition-coursework\Lab 4\corrupted_voice.wav')

T = 1/Fs;             % Sampling period       
t = (0:length(y)-1)*T;        % Time vector

P2 = abs(y1/length(y)); %double-sided spec
P1 = P2(1:length(y)/2+1);
P1(2:end-1) = 2*P1(2:end-1); %single sided spectrum with proper length

f = Fs*(0:(length(y)/2))/length(y)%
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|') % noise peaks at 100 and 6000 Hz

%% -> worcks
d = designfilt('bandstopiir','FilterOrder',2, ...
               'HalfPowerFrequency1',99,'HalfPowerFrequency2',101, ...
               'DesignMethod','butter','SampleRate',Fs);
d2 = designfilt('bandstopiir','FilterOrder',20, ...
               'HalfPowerFrequency1',5500,'HalfPowerFrequency2',6500, ...
               'DesignMethod','butter','SampleRate',Fs);

butternut = filtfilt(d,y);
buttnut= filtfilt(d2,butternut);
audiowrite('voice_butternut.wav',buttnut,Fs)

%freqz(d2)

t = (0:length(y)-1)/Fs;
%plot(t,y,t,butternut)f
%last version
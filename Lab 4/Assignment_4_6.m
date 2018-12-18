c = imread('X:\My Documents\GitHub\Pattern-Recognition-coursework\Lab 4\dogGrayRipples.png');

Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = length(c);             % Length of signal
t = (0:L-1)*T;        % Time vector

cf=fft2(c)
cf1 = fftshift(cf)
cf2 = abs(cf1)

plot(cf)





%%


d = designfilt('highpassfir', 'PassbandFrequency', 0.25,...
             'StopbandFrequency', 170, 'PassbandRipple', 0.5, ...
             'StopbandAttenuation', 65, 'DesignMethod', 'kaiserwin');
d2 = designfilt('lowpassfir', 'PassbandFrequency', 0.25,...
             'StopbandFrequency', 130, 'PassbandRipple', 0.5, ...
             'StopbandAttenuation', 65, 'DesignMethod', 'kaiserwin');

butternut = filtfilt(d,c);
buttnut= filtfilt(d2,butternut);
buttnut
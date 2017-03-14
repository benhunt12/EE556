clearvars;
close all;

[x,fs]=audioread('Audio_File_Fall_2016.wav');
t = [1/fs:1/fs:length(x)/fs];
figure(1)
stem(t,x)
title('Orginal Output');
ylabel('Signal');
xlabel('Time (s)');

OrigSize = size(x,1);
df = fs / OrigSize;
w = (-(OrigSize/2):(OrigSize/2)-1)*df;
x1 = fft(x(:,1), OrigSize) / OrigSize; % For normalizing, but not needed for our analysis
x2 = fftshift(x1);
figure(2);
plot(w,abs(x2));
title('Orginal Frequncy Response');
ylabel('Signal');
xlabel('Frequency (Hz)) ');
figure(10);
freqz(x,fs);
title({'Orginal','Magnitude & Phase'})
 
%-------------------------------------------------------------------------%
%StopBand1%
n = 7;
beginFreq = 1050 / (fs/2);
endFreq = 1300 / (fs/2);
[b a] = butter(n, [beginFreq, endFreq], 'stop');
fOut = filter(b, a, x);
x3 = fft(fOut(:,1), OrigSize) / OrigSize;
x4 = fftshift(x3);
figure(3);
plot(w,abs(x4));
title('After First Band-Stop Filter');
ylabel('Signal (Hz)');
xlabel('Frequency (\omega) ');
figure(4);
freqz(b,a);
title({'After First Band-Stop Filter','Magnitude & Phase'})
%StopBand2%
n2 = 3;
beginFreq2 = 50 / (fs/2);
endFreq2 = 300 / (fs/2);
[b2 a2] = butter(n2, [beginFreq2, endFreq2], 'stop');
fOut2 = filter(b2, a2, fOut);
x5 = fft(fOut2(:,1), OrigSize) / OrigSize;
x6 = fftshift(x5);
figure(5);
plot(w,abs(x6));
title('After Second Band-Stop Filter');
ylabel('Signal (Hz)');
xlabel('Frequency (\omega) ');
figure(6);
freqz(b2,a2)
title({'After Second Band-Stop Filter','Magnitude & Phase'})

%HighPass Filter%
n3 = 2;
beginFreq3 = 500 / (fs/2);
[b3 a3] = butter(n3, beginFreq3, 'high');
fOut3 = filter(b3, a3, fOut2);
x7 = fft(fOut3(:,1), OrigSize) / OrigSize;
x8 = fftshift(x7);
figure(7);
plot(w,abs(x8));
title('After High Pass Filter');
ylabel('Signal (Hz)');
xlabel('Frequency (\omega) ');
figure(8);
freqz(b3,a3)
title({'After High Pass Filter','Magnitude & Phase'})
t=[1/fs:1/fs:length(fOut3)/fs];
figure(9);
stem(t,fOut3)
title('Final Output');
ylabel('Signal (Hz)');
xlabel('Time');


first = double(abs(fOut3 - x));
second = double((fOut3 + x)/2);
final = (first / second) .* 100;


 
p = audioplayer(fOut3, fs);
play(p);
figure(1); %show the signal
stem(z(:,1),z(:,end)); %plot the first column versus the second
xlabel('Time(s)')
ylabel('Signal')
title('Signal.mat')

fs = 600; %600 samples in the signal, creating a frequency
f = fs/2*linspace(-1,1,fs);

figure(2); %show the fft of the original signal
w = fft(z(:,end)); %find the fft of the second column
stem(f,abs(w));
title('Magnitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

znew = repmat(z,1); %copy the signal to be manipulated
znew(480:600,end) = zeros; %fill the last 120 spots in the second column with zeros

figure(3); %show the new fft of the manipulated signal
x = fft(znew(:,end));
stem(f,abs(x));
title('Magnitude Spectrum of Manipulated Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

[P,Q] = rat(abs(x)/min(abs(x)));
f0 = min(abs(x)) / max(Q);
f0

figure(4);
[l,lags] = xcorr(x);
[~,L] = max(abs(l));
stem(lags,l);
legend(sprintf('Maximum at lag %d',lags(L)))
title('Cross-Correlation Sequence');

figure(5);
[l1,lags1] = xcorr(x,'unbiased');
stem(lags1,l1);
legend(sprintf('Maximum at lag %d',lags1(L)))
title('Unbiased Cross-Correlation Sequence')
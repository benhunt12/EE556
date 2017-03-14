y1 = [-2 1 -3 -5 6 8];
y2 = [1 2 3 4];
N = 7;


x1 = fft(y1,N);
x2 = fft(y2,N);
xk = x1.*x2;
xdft = ifft(xk);
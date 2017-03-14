f0 = 262;
A = 2;
phi = pi/4;
fsampling = 8000;
tsampling = 1/fsampling;
t = -0.005:tsampling:0.005;

xt = A*sin((2*pi*f0*t) + phi)
stem(t, xt); xlabel('t sec'); ylabel('x(t)');

yt = sawtooth(2*pi*f0*t);
stem(t, yt); xlabel('t sec'); ylabel('y(t)');

zt = A*sinc(2*f0*t);
stem(t, zt); xlabel('t sec'); ylabel('z(t)');


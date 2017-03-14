f0 = 262;
A = 2;
phi = pi/2;
fsampling = 8000;
tsampling = 1/fsampling;
t = -0.005:tsampling:0.005;

xt = A*sin(2*pi*f0*t + phi)
stem(t, xt)
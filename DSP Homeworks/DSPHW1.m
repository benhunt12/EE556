n = (-20:40);
sig = 2*cos(2*pi*(0.3)*n + (pi/3));

figure;
stem(n, sig);
title('Sinusoidal Sequence');
xlabel('n');
ylabel('x[n]');
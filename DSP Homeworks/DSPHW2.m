n = (0:100);

%move y terms to left-hand side of the equation to get coefficients
y = [1 -1.15 1.5 -0.7 0.25];
x = [0.18 0.1 0.3 0.1 0.18];

h = impz(x,y,length(n));

unit_step = zeros(1, length(n));
unit_step (n>0) = 1;
fil = filter(x,y,unit_step);

co = conv(h, unit_step);

fil2 = filter(h,1,unit_step);

figure;
stem(n, fil2);
title('Unit Step --- Fil2');
xlabel('n');
ylabel('x[n]');
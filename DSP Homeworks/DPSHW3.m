ws = 0.5*pi; wp = 0.3*pi;
As = 50; Ap = 0.5;
[deltap, deltas] = spec_convert(Ap,As, "rel" ,?abs?); 
delta = min([deltap,deltas]);
A = -20*log10(delta);

wc = (ws+wp)/2;
dw = ws - wp;
L = 6.6*pi/dw;
M = L-1;
if mod(M,2) == 1
    M = M+1; 
end

hd = ideallp(wc,M);
h = hd.*hamming(M+1);









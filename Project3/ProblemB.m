% Reza Aablue
% 500966944
% Section 05

% Problem B.1
No = 32;
Wo = pi/16;
n = (0:31);

Xofr = [ones(1,5) zeros(1,23) ones(1,4)]; % Plotting all points from r=0 up to r=31.

for r = 0:31
   xn(r+1) = sum (Xofr.*exp(1i*n*(pi/16)*r)); 
end

figure (1);
stem (n, xn);
xlabel ('n');
title ('x[n] (Obtained from Inverse DTFS)');

% Problem B.2
% No = 32, n = (0:31), and Wo = pi/16.
XofrProduct = [ones(1,5) zeros(1,23) ones(1,4)].*exp(-1i*5*(pi/16)*n);
for r = 0:31
   xn(r+1) = sum (XofrProduct.*exp(1i*n*(pi/16)*r)); 
end
r=n;

figure (2);
stem (r,xn);
xlabel ('n');
title ('x[n] Obtained from the Inverse DTFS of the product');
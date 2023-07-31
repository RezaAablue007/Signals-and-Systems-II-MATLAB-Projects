% Reza Aablue
% 500966944
% Section 05

% Problem A.1
xofn = zeros (1,128); % Zeros array of 128 pre-allocated points.
n = (0:127);
xofn(1:7) = 1-((1/7).*n(1:7)); % Equation of the line for n=0 up to n=7.

XofF = fft(xofn); % Fast FT of x[n].
XofF = fftshift(XofF);
Wo=linspace (-pi, pi, 128);

% Problem A.2
XofFmanual = @(a) (1 + (6/7).*exp(-1.*1i.*a) + (5/7).*exp(-2.*1i.*a) + (4/7).*exp(-3.*1i.*a) + (3/7).*exp(-4.*1i.*a) + (2/7).*exp(-5.*1i.*a) + (1/7).*exp(-6.*1i.*a));

figure (1);
subplot (2,1,1);
plot (Wo, abs (XofF));
hold on;
plot (Wo, abs (XofFmanual(Wo)),'--');
legend ('MATLAB-Generated Plot','Hand-Calculated Plot');
hold off;
axis ([-pi pi 0 5]);
xlabel ('\Omega'); ylabel ('Magnitude');

subplot (2,1,2);
plot (Wo, angle (XofF));
hold on;
plot (Wo, angle (XofFmanual(Wo)),'--');
legend ('MATLAB-Generated Plot','Hand-Calculated Plot');
hold off;
axis ([-pi pi -2 2]);
xlabel ('\Omega'); ylabel ('Phase (Radians)');

% Problem A.3
XofF=ifftshift(XofF);
z=ifft(XofF);

figure (2);
subplot (2,1,1);
stem (n,xofn);
title('Original x[n] graph');
xlabel('n'); ylabel ('x[n]');
axis ([0 127 -2 2]);

subplot (2,1,2);
stem (n,z);
title ('Inverse FFT of x(\Omega)');
xlabel ('n'); ylabel ('Reconstructed x[n]');
axis ([0 127 -2 2]);
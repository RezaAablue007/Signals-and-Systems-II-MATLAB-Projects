% Reza Aablue
% 500966944
% Section 05

% Problem C.1 (N=35)
N = 35; W = linspace (0,2*pi*(1-1/N),N);
H_d_35 = @ (W) (mod(W,2*pi)>(2/3)*pi).*(mod(W,2*pi)<2*pi-(2/3)*pi);
H_35 = H_d_35 (W);
H_35 = H_35.*exp(-1i*W*((N-1)/2));
H_35_real = real (ifft(H_35));

figure (1); stem (H_35_real);
title ('h[n] with filter length N=35 and Wo = 2*pi/3'); xlabel('n');

% Problem C.2 (H(\Omega), N=35)
H_35_ofF = freqz (H_35_real,1,0:2*pi/1001:2*pi);

% Problem C.4 (h[n], N=71)
N2=71; W2 = linspace (0,2*pi*(1-1/N2),N2);
H_d_71 = @ (W2) (mod(W2,2*pi)>(2/3)*pi).*(mod(W2,2*pi)<2*pi-(2/3)*pi);
H_71 = H_d_71 (W2);
H_71 = H_71.*exp(-1i*W2*((N2-1)/2));
H_71_real = real (ifft(H_71));

figure (2);
stem (H_71_real); title ('h[n] with filter length N=71 and Wo = 2*pi/3');
xlabel ('n');

% Problems C.2 and C.4 (H(\Omega), N=35 and N=71)
H_71_ofF = freqz (H_71_real,1,0:2*pi/1001:2*pi);

figure(3); plot (abs (H_35_ofF)); hold on;
plot (abs (H_71_ofF)); hold off; 
title ('Comparison of H(\Omega) with filter lengths N=35, N=71');
xlabel ('\Omega'); legend ('N=35','N=71');
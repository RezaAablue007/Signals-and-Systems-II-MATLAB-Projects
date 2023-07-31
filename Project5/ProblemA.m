% Reza Aablue
% 500966944
% Section 05

% Problem A.1
n1 = 0:9; % 10 samples will be taken.
fr = linspace (-0.5, 0.5-1/10, 10); % Frequency fr.
N1 = length (n1); % Length of samples is 10.

x1 = exp(1i*2*pi*n1*(30/100)) + exp(1i*2*pi*n1*(33/100)); % x1[n] signal.
x2 = cos(2*pi*n1*(30/100)) + 0.5*cos(2*pi*n1*(40/100)); % x2[n] signal.

X1 = fft (x1,N1); X2 = fft (x2, N1);

figure (1);
subplot (2,1,1); stem (fr, abs(fftshift(X1)));
title ('|X1(\Omega)| with N=10 samples'); xlabel ('\Omega'); grid;
subplot (2,1,2); stem (fr, abs(fftshift(X2)));
title ('|X2(\Omega)| with N=10 samples'); xlabel ('\Omega'); grid;

% Problem A.2
n2 = 0:499; % 500 samples will be taken.
N2 = length (n2);
fr2 = linspace (-0.5, 0.5-1/500, 500); % Frequency fr.

x1ofn = [zeros(1,245),x1,zeros(1,245)]; 
X1ofF = fft(x1ofn, N2);
x2ofn = [zeros(1,245),x2,zeros(1,245)];
X2ofF = fft(x2ofn, N2);

figure (2);
subplot (2,1,1); stem (fr2, abs(fftshift(X1ofF)));
title ('|X1(\Omega)| with N=10 samples (zero-padded with 490 zeros)');
xlabel ('\Omega'); grid;
subplot (2,1,2); stem (fr2, abs(fftshift(X2ofF)));
title ('|X2(\Omega)| with N=10 samples (zero-padded with 490 zeros)');
xlabel ('\Omega'); grid;

% Problem A.3
n3 = 0:99; % 100 samples will be taken
N3 = length(n3);
fr3 = linspace (-0.5, 0.5-1/100, 100); % Frequency fr.

x_1 = exp(1i*2*pi*n3*(30/100)) + exp(1i*2*pi*n3*(33/100)); % x1[n] signal.
x_2 = cos(2*pi*n3*(30/100)) + 0.5*cos(2*pi*n3*(40/100)); % x2[n] signal.

X_1 = fft (x_1,N3); X_2 = fft (x_2, N3);

figure (3); 
subplot (2,1,1); stem (fr3, abs(fftshift(X_1)));
title ('|X1(\Omega)| with N=100 samples'); xlabel ('\Omega'); grid;
subplot (2,1,2); stem (fr3, abs(fftshift(X_2)));
title ('|X1(\Omega)| with N=100 samples'); xlabel ('\Omega'); grid;

% Problem A.4
n4 = 0:499; % 500 samples will be taken.
N4 = length(n4);
fr4 = linspace (-0.5, 0.5-1/500, 500); % Frequency fr.

x1_n = [zeros(1,200),x_1,zeros(1,200)]; 
X1_F = fft(x1_n, N4);
x2_n = [zeros(1,200),x_2,zeros(1,200)];
X2_F = fft(x2_n, N4);

figure (4);
subplot (2,1,1); stem (fr4, abs(fftshift(X1_F)));
title ('|X1(\Omega)| with N=100 samples (zero-padded with 400 zeros)');
xlabel ('\Omega'); grid;
subplot (2,1,2); stem (fr4, abs(fftshift(X2_F)));
title ('|X2(\Omega)| with N=100 samples (zero-padded with 400 zeros)');
xlabel ('\Omega'); grid;
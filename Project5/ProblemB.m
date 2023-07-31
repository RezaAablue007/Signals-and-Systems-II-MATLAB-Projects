% Reza Aablue
% 500966944
% Section 05

load chirp.mat
filename = 'chirp.wav';
audiowrite (filename,y,Fs);
clear y Fs
[y,fs] = audioread ('chirp.wav');

% Problem B.1
No = length (y) % Number of samples.
To = No/fs % Period of signal.
T = 1/fs % Sampling interval.

% Problem B.2
t = linspace (0,To,No);
figure (1); plot (t,y); title ('Plot of y with respect to time'); xlabel ('t'); grid;

% Problem B.3
w = linspace (-(fs/2),(fs/2),No);
Y = fft (y); 
figure (2); plot (w,fftshift(abs(Y)));
title ('Y(\Omega): DTF of y(t)'); xlabel('\Omega'); grid;

% Problem B.4
y1 = y(1:2:No);
N1 = length (y1)
T01 = N1/fs
T1 = 2*fs

% Problem B.5
t1 = t(1:2:No);
figure (3); plot (t1,y1); title ('Plot of y1 with respect to time'); grid;

% Problem B.6
w1 = linspace (-(fs/4),(fs/4),N1);
Y1 = fft (y1); 
figure (4); plot (w1, fftshift(abs(Y1)));
title ('Y1(\Omega): DFT of y1'); xlabel ('\Omega'); grid;

% Problem B.7
% Commands to use: sound (y,fs), sound (y1,fs)

% Problem B.8
% Command to use: sound (y5, fs)
y5 = y(1:5:No);
N5 = length (y5);
T05 = N5/fs;
T5 = 2*fs;
t5 = t(1:5:No);

w5 = linspace(-(fs/10),(fs/10),N5);
Y5 = fft (y5);

figure (5); plot (t5, y5);
title ('Plot of y5 with respect to time'); grid;

figure (6); plot (w5,fftshift(abs(Y5)));
title ('Y5(\Omega): DFT of y5'); xlabel ('\Omega'); grid;
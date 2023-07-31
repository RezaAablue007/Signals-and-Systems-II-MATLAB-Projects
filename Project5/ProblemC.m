% Reza Aablue
% 500966944
% Section 05

% Problem C.1
file = 'chirp.wav'
[y,Fs] = audioread(file);
audio = y;
audio_DFT = fftshift(fft(audio)); % DFT of audio signal.
Fs_half = Fs/2;
t = 0:1:length(audio_DFT)-1; t=t/10000; 
f = linspace (0,Fs,length(y)); f=f-Fs_half;

% LPF at 2 KHz
H = abs (f) < 2000; H = transpose (H); 
filtered_audio = H.*audio_DFT; % Filtered system at 2 KHz.

figure (1); subplot (2,1,1); plot (t, audio);
title ('Audio signal in time-domain'); xlabel ('Time (sec.)'); grid on;
subplot (2,1,2); plot (f,abs(audio_DFT)); title ('Audio Signal in Frequency Domain');
xlabel ('Frequency (Hz)'); grid on;

figure (2); plot (f,abs(H)); title ('Lowpass Filter (2 KHZ)'); xlabel('Frequency (Hz)'); grid on;

figure (3); subplot (2,1,1); plot (f,abs(filtered_audio));
title ('Audio Signal in Freq. Domain [-2 KHz:2 KHz]'); xlabel ('Frequency (Hz)'); grid on;
subplot (2,1,2); plot (t,real(ifft(fftshift(filtered_audio))));
title ('Filtered Audio - Time Domain'); xlabel ('Time (sec.)'); grid on;

% Problem C.2
sound (real(ifft(fftshift(filtered_audio))),Fs);

% Problem C.3
% Bandpass bass filtering out (16-256 Hz)
H2 = ~(abs(f) >= 16 & abs (f) <= 256);
H2 = transpose (H2);

% Filtering out bass frequencies
filtered_audio2 = audio_DFT.*H2;
figure (4); plot (f,abs(H2));
title ('Bass Filter [16 Hz:256 Hz]'); xlabel ('Frequency (Hz)'); grid on;

figure (5); subplot (2,1,1); plot (f,abs(filtered_audio2));
title ('Filtered Audio - Frequency Domain'); xlabel ('Frequency (Hz)'); grid on;
subplot (2,1,2); plot (t,real(ifft(fftshift(filtered_audio2))));
title ('Filtered Audio - Time Domain'); xlabel ('Time (sec.)'); grid on;

sound (real(ifft(fftshift(filtered_audio2))),Fs);

% Problem C.4
% Bandpass filter (2048-16384 Hz)
H3 = abs (f) >= 2048 & abs (f) <= 16384;
H3 = transpose (H3);

% Change amplitude of BPF to 0.25 to reduce the frequency components
% passing through it
H3 = H3.*0.25;

% Take the 25% to add to original audio
filtered_audio3 = audio_DFT + (audio_DFT.*H3);

figure (6); plot (f,real(H3));
title ('Treble Filter [2048 Hz: 16384 Hz]'); xlabel ('Frequency (Hz)');
grid on;

figure (7); subplot (2,1,1); plot (f,abs(filtered_audio3));
title ('Amplified Audio - Frequency Domain'); xlabel ('Frequency (Hz)');
grid on;
subplot (2,1,2); plot (t,real(ifft(filtered_audio3)));
title('Amplified Audio - Time Domain'); xlabel ('Time (sec.)'); grid on;

sound (real(ifft(fftshift(filtered_audio3))),Fs);
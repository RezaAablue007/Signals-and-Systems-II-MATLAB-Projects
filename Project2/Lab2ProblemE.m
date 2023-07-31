% Reza Aablue
% 500966944
% Section 05

%Problem E
n = [-10:20];
impulse = @(n) (n==0) * 1.0 .* (mod(n,1)==0);

B = [2]; % Coefficients on x[n] side. (Difference eq'n of part B)
A = [1 -0.3 -0.1]; %Coefficients on y[n] side. (Difference eq'n of part B)
ZIResponse = filter (B, A, impulse(n)); % Zero-input response.

u = @(n) (n>=0) * 1.0 .* (mod(n,1)==0);
xofn = @(n) 2*cos ((n*pi)/3).*(u(n)-u(n-10)); % Input from Problem C.
ZSResponse = filter (B, A, xofn (n)); % Zero-state response.

convolution = conv (xofn(n), ZIResponse); 

figure (1);
stem (convolution);
title ("Zero-state Response using conv Command");
% Reza Aablue
% 500966944
% Section 05

% Problem C.1
u = @(n) (n>=0) * 1.0 .* (mod(n,1)==0); % Unit step function.
H = @(n) u(n+4)-u(n-5); % H[r] frequency response.
No = 32;
Wo = (2*pi/No);
n = (-16:15);

figure (1);
subplot(2,1,1);
stem (n,H(n));
xlabel('r');
ylabel('H[r]');
axis ([-10 10 -2 2]);
title ('DTFS of Frequency Response H[r]');

subplot(2,1,2);
stem (n.*Wo, H(n));
xlabel('\omega');
ylabel('H[\omega]');
axis ([-2*pi 2*pi -2 2]);
title ('DTFS of Frequency Response wrt. \omega');

% Problem C.2 and C.3
% No = 32 and Wo = (2*pi/No).
n1 = (0:31);
H1 = [ones(1,5) zeros(1,23) ones(1,4)]; % Frequency response H[r].
x1 = @(n1) 4.0*cos(n*pi/8); % x1[n] function.
x2 = @(n1) 4.0*cos(n*pi/2); % x2[n] function.

for r = 0:31
    X1(r+1) = sum (x1(n1).*exp(-1i.*r.*Wo.*n1))/No;
    X2(r+1) = sum (x2(n1).*exp(-1i.*r.*Wo.*n1))/No;
end

figure (2);

subplot(2,1,1);
stem (n1.*Wo, H1.*abs(X1));
axis ([-0.2 2*pi -5 5]);
xlabel ('r');
ylabel ('Y1(r)');
title ('Y1[r]=X1[r]H[r]');

subplot(2,1,2);
stem (n1.*Wo, H1.*abs(X2));
axis ([-1 7 -5 5]);
xlabel ('r');
ylabel ('Y2(r)');
title ('Y2[r]=X2[r]H[r]');
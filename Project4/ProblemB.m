% Reza Aablue
% 500966944
% Section 05

% Problem B.1
n = 0:1000;
u = @(n) (n>=0) * 1.0 .* (mod(n,1)==0); % Unit step function u[n].
xofn = @(n) sin (0.2*n*pi).*(u(n)-u(n-10)); % x[n] expression.
omega = linspace (-pi,pi,1001);
W_omega = exp(-1i).^((0:length(xofn(n))-1)'*omega);
XofF = (xofn(n)*W_omega);

figure (1);
plot (abs(XofF)); title ('X(\Omega) = DTFT of x[n]'); xlabel ('\Omega');

% Problem B.2
h = @(n) (u(n)-u(n-10)); % h[n] function.
Wh = linspace (-pi,pi,1001);
Wh_omega = exp(-1i).^((0:length(h(n))-1)'*Wh);
HofF = (h(n)*Wh_omega);

figure (2);
plot (abs(HofF)); title ('H(\Omega) = DTFT of h[n]'); xlabel ('\Omega');

% Problem B.3
Y1 = XofF.*HofF;
figure (3); plot (abs(Y1)); hold on;

% Problem B.4
Y2 = conv (xofn(n),h(n));

% Problem B.5
Wy = linspace (-pi,pi,1001);
Wy_omega = exp(-1i).^((0:length(Y2)-1)'*Wy);
Y2ofF = (Y2*Wy_omega);

plot (abs(Y2ofF), '--');
hold off; 
title ('Comparison of Y(\Omega) obtained through Freq. Domain product and DTFT of y[n]');
legend ('Y(\Omega)=X(\Omega)H(\Omega)','Y(\Omega) = DTFT of y[n]'); xlabel ('\Omega');
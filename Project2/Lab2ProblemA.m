% Reza Aablue
% 500966944
% Section 05

%Problem A
n = [-30:30];
u = @(n) (n>=0) * 1.0 .* (mod(n,1)==0);

% Calculating h1[n] and h2[n] by hand - detailed work attached in report.
h1Handcalc = @(n) ((1/5).*(-0.5).^n + (2/15).*(1/3).^n).*u(n);
h2Handcalc = @(n) ((1/2).^n.*cos(n*pi/2).*u(n));

% Calculating h1[n] and h2[n[ using filter command.
impulse = @(n) (n==0) * 1.0 .* (mod(n,1)==0);

B = 1/3; % Coefficients from x[n] side.
A = [1 1/6 -1/6]; % Coefficients from y[n] side.

h1Filter = filter (B,A,impulse(n)); % h1[n].

D = 1; % Coefficients from x[n] side.
C = [1 0 1/4]; % Coefficients from y[n] side.

h2Filter = filter (D,C,impulse(n)); % h2[n].

figure (1);

subplot (4,1,1);
stem (n,h1Handcalc(n));
title("Hand-Calculated Graph of h1[n] Unit Impulse Response");

subplot (4,1,2);
stem (n,h1Filter);
title("Graph of h1[n] Unit Impulse Response using Filter command");

subplot (4,1,3);
stem (n,h2Handcalc(n));
title("Hand-Calculated Graph of h2[n] Unit Impulse Response");

subplot (4,1,4);
stem (n,h2Filter);
title("Graph of h2[n] Unit Impulse Response using Filter command");

% Verify value of h[3] in both cases.
threshold = 1e-10; % Used to compare the difference between the
% hand-calculated and simulated graphs.

h1Check = all (h1Handcalc(n)-h1Filter <= threshold);
h2Check = all (h2Handcalc(n)-h2Filter <= threshold);
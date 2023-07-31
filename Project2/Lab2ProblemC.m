% Reza Aablue
% 500966944
% Section 05

%Problem C
n = [-10:20];
u = @(n) (n>=0) * 1.0 .* (mod(n,1)==0);
xofn = @(n) 2*cos ((n*pi)/3).*(u(n)-u(n-10));

B = [2]; % Coefficients on x[n] side. (Difference eq'n of part B)
A = [1 -0.3 -0.1]; %Coefficients on y[n] side. (Difference eq'n of part B)

ZSResponse = filter (B, A, xofn (n)); % Zero-state response.

figure(1);
stem(ZSResponse);
title ("Zero-State Response of the input in Problem C with the system of Problem B");
% Reza Aablue
% 500966944
% Section 05

%Problem B
B = [2]; % Coefficients on x[n] side.
A = [1 -0.3 -0.1]; %Coefficients on y[n] side.
Init = [1 2]; % Initial conditions.
xInitConditions = filtic (B,A,Init); % System's initial conditions.
ZIResponse = filter (B,A,zeros(1,20),xInitConditions); % Zero-input response of system.

figure (1);
stem (ZIResponse);
title ("Zero-Input Response of the System in Problem B");
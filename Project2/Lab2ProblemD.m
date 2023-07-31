% Reza Aablue
% 500966944
% Section 05

%Problem D
n = [-10:20];
u = @(n) (n>=0) * 1.0 .* (mod(n,1)==0);
xofn = @(n) 2*cos ((n*pi)/3).*(u(n)-u(n-10));

B = [2]; % Coefficients on x[n] side. (Difference eq'n of part B)
A = [1 -0.3 -0.1]; %Coefficients on y[n] side. (Difference eq'n of part B)
Init = [1 2]; % Initial conditions.

xInitConditions = filtic (B, A, Init); % Find initial conditions of the system.

ZIResponse = filter (B, A, zeros(1,31), xInitConditions); % Zero-input response of system.
ZSResponse = filter (B, A, xofn (n)); % Zero-state response.
                                                  
totalResponseMethodOne = filter (B,A, xofn(n), xInitConditions);

totalResponseMethodTwo = ZIResponse + ZSResponse; % Finding total response through summing up
                                                  % zero-input and zero-state responses.

figure (1);

subplot (2,1,1);
stem (n, totalResponseMethodOne);
title ("Total Response of System by using the filter Command");

subplot (2,1,2);
stem (n, totalResponseMethodTwo);
title ("Total Response of System by Summing Zero-input and Zero-state Responses");
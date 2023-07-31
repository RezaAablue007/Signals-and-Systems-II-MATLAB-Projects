% Reza Aablue
% 500966944
% Section 05

%Problem F
n = [0:50];
impulse = @(n) (n==0) * 1.0 .* (mod(n,1)==0);
xofn = @(n) cos((n*pi)/5) + impulse (n-30) - impulse (n-35);

figure (1);

subplot(3,1,1);
[a, b] = params (4); % Filter with N=4 case.
stem(n,filter(b, a, xofn (n)));
title ("Filter with N = 4");

subplot(3,1,2);
[a, b] = params (8); % Filter with N=8 case.
stem(n,filter(b, a, xofn (n)));
title ("Filter with N = 8");

subplot(3,1,3);
[a, b] = params (12); % Filter with N=12 case.
stem(n,filter(b, a, xofn (n)));
title ("Filter with N = 12");

function [a,b] = params (N)
    a = 1;
    b = ones(N,1)/N;
end
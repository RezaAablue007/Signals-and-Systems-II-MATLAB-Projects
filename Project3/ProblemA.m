% Reza Aablue
% 500966944
% Section 05

% Problem A.2
No = 5;
Wo = 0.4*pi;
n=(0:4); % Range from 0 to (No-1).

x = @(n) (4.*cos(2.4.*pi.*n) + 2.*sin(3.2.*pi.*n));

for r=0:4
    xr(r+1) = sum (x(n).*exp(-1i*r*(0.4*pi)*n))/5;
end

r=n;

figure(1);

subplot (3,1,1);
a=(0:4);
y=x(a);
stem (a,y);
title ('x[n]');

subplot (3,1,2);
stem (r,abs(xr));
title ('|Dr|');

subplot (3,1,3);
stem (r,angle(xr));
title ('Angle (Dr)');

% Problem A.3
No1 = 6;
Wo1 = pi/3;
n1 = (0:5);

yofn = [3 2 1 0 1 2]; % All values for y[n] in one period.

for s=0:5
   ys(s+1)=sum(yofn.*exp(-1i*s*(pi/3)*n1))/6; 
end

s=n1;

figure(2);
b=(0:5);

subplot (3,1,1);
stem (b,yofn);
title ('y[n]');

subplot (3,1,2);
stem (s,abs(ys));
title ('|Dr|');

subplot (3,1,3);
stem (s,angle(ys));
title ('Angle (Dr)');
% Reza Aablue
% 500966944
% Section 05

%Problem A.1
n = [-20:20]; % Create a discrete range of n values, from -20 up to 20 with increments of 1.

impulseFunction = @(n) (n==0) * 1.0 .* (mod(n,1)==0); % Define impulse function (delta[n]).
x1ofn = impulseFunction (n-3); % x1 [n] = delta [n-3]

unitStepFunction = @(n) (n>=0) * 1.0 .* (mod(n,1)==0); % Define unit step function (u[n]).
x2ofn = unitStepFunction (n+1); % x2 [n] = u [n+1]

xofn = @(n) unitStepFunction(n) .* cos((n.*pi)/5); % Define assignmed x[n] function.
x3ofn = xofn (n); % Labelling of x[n] function.
shift = @(n) xofn (n-3); % Define the fourth function.
x4ofn = shift (n);
reflect = @(n) xofn (-n); % Define fifth function.
x5ofn = reflect (n);

figure (1); % Contains x1[n] and x2[n] functions.
subplot (2,1,1);
stem(n,x1ofn); % Plot x1[n] function.
title("x1[n]=Delta[n-3]");
subplot (2,1,2);
stem(n,x2ofn); % Plot x1[n] function.
title("x2[n]=u[n+1]");

figure (2); % Contains x3[n], x4[n], and x5[n] functions.
subplot (3,1,1);
stem(n,x3ofn); % Plot x3[n] function.
title("x3[n]=u[n]cos((n.pi)/5)");
subplot (3,1,2);
stem(n,x4ofn); % Plot x4[n] function.
title("x4[n]=x3[n-3]");
subplot (3,1,3);
stem(n,x5ofn); % Plot x5[n] function.
title("x5[n]=x3[-n]");

% Problem A.2
y = @(n) 5*exp(-n/8).*(unitStepFunction (n) - unitStepFunction (n-10)); % Define y[n] function.
yofn = y(n);

y1 = @(n) y(3.*n);
y1ofn = y1(n);

y2 = @(n) y(n/3);
y2ofn = y2(n);

figure (3); % Contains y[n], y1[n], and y2[n] functions.
subplot (3,1,1);
stem(n,yofn); % Plot y[n] function.
title("y[n]=5 exp(-n/8) (u[n]-u[n-10])");
subplot (3,1,2);
stem(n,y1ofn); % Plot y1[n] function.
title("y1[n]=y[3n]");
subplot (3,1,3);
stem(n,y2ofn); % Plot y2[n] function.
title("y2[n]=y[n/3]");

% Problem A.3

% Comparing yofn plot and y3(t) signals.
unitStepFunction2 = @(n) (n>=0) * 1.0;
z = @(n) 5*exp(-n/8).*(unitStepFunction2 (n) - unitStepFunction2 (n-10));
y3 = @(n) z(n/3) .* (mod(n,1)==0);
n=[-20:1:20];

figure(4);
subplot (2,1,1);
stem(n,y2ofn); % Plot y[n] function.
title("y2[n] from A.2");
subplot (2,1,2);
stem(n,y3(n)); % Plot y3[n] function.
title("y3[n]=z[n/3]");
% Reza Aablue
% 500966944
% Section 05

% Problem B.1

% y[n] = y [n-1] + 0.02 .* y[n-1] + x[n]  (last month's balance + interest
% + deposit)

% Problem B.2

y = zeros (1, 12); % Zeros matrix for the balance at each month of the year.
y(1) = 1.02 * 2000; % Balance for January.
% Assuming no deposits in the new year.

for i=2:12
    y(i) = y(i-1) + 0.02 * y(i-1);
end

figure (1);
stem (y); grid;
title ("Zero Input Respose of y[n] - Problem B.2");
xlabel ('Month of Year'); ylabel ("Balance (CAN Dollars)")

% Problem B.3
y1 = zeros (1,12);
y1(1) = (1.02 * 2000) + (100 * 1);

for j=2:12
    y1(j) = y1(j-1) + (0.02 * y1(j-1)) + (100 * j);
end

figure (2);
stem (y1); grid;
title ("Zero Input Respose of y[n] - Problem B.3");
xlabel ('Month of Year'); ylabel ("Balance (CAN Dollars)")
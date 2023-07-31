% Reza Aablue
% 500966944
% Section 05

% Problem C.1

function output = Lab1ProblemC (N) % Create max. filter function.
n=[0:45]; % Arbitrary values of n.

impulseFunction = @(n) (n==0) .* 1.0 .* (mod(n,1)==0);

x = @(n) (cos(n.*pi/5) + impulseFunction(n-20) - impulseFunction(n-35)) .* 1.0 .* (mod(n,1)==0); 
xofn = x(n); % Create an array of output for the generic function.

f = [zeros(1,(N-1)) xofn]; % Pad input vector with N-1 zeros.
output = [];

for i=1:(length(f)-(N-1))
    temporaryVariable = f(1:1, i:i+(N-1));
    maximumOutput = max (temporaryVariable);
    output = [output maximumOutput];
end

% Problem C.2
clear; 
n=[0:45];

figure (1);

subplot(3,1,1);
stem(n,Lab1ProblemC(4));
title("Max Filtering with N=4");
xlabel("N")
ylabel("maxFilter(4)");

subplot(3,1,2);
stem(n,Lab1ProblemC(8));
title("Max Filtering with N=8");
xlabel("N");
ylabel("maxFilter(8)");

subplot(3,1,3);
stem(n,Lab1ProblemC(12));
title("Max Filtering with N=12");
xlabel("N");
ylabel("maxFilter(12)");
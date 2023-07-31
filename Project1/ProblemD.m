% Reza Aablue
% 500966944
% Section 05

% Problem D.1

function [power, energy] = ProblemD (x,N) 

n = length (x);
a=(2*N)+1;
power = (1/a) .* sum(abs(x.^2));
energy = sum(abs(x.^2));
disp("Power  = "); disp(power);
disp("Energy  = "); disp(energy);
end
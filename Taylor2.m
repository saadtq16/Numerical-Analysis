%creating dataset
x = [0.0 0.2 0.4 0.6 0.8 1.0];
y = [0.0000000 7.7800000 10.6800000 8.3700000 3.9700000 0.000000];

h = x(2) - x(1);
target = 0.2;

for i=1:length(x)
   if x(i) == target
       index = i;
   end
end

syms EI
d2y = (y(index) - 2*y(index+1) + y(index+2)) / (h*h);
val = d2y * EI;
disp('Using three-point formula');
fprintf('\nM(0.2) = %s\n', vpa(val));
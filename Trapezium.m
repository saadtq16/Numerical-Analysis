g = 9.8;
m = 68.1;
cd = 0.25;
syms t;

v(t) = sqrt((g*m)/cd) * tanh((sqrt((g*cd)/m) * t));

T = [];
V = [];
n = 10;

for i = 0:n
    T = [T ; i];
    %value = vpa(v(i));
    V = [V ; vpa(v(i))]
end

add = 0;
for i = 2:n
   add = add + V(i); 
end

%printing vectors V and T
fprintf('\nT = [');
for i = 1:n+1
   fprintf('%d ',T(i)) 
end
fprintf(']\n');

fprintf('\nV = [');
for i = 1:n+1
   fprintf('%.5f ',V(i)) 
end
fprintf(']\n');

%applying trapezoid rule
h = T(n+1) - T(1);
dist = (h/(2*n)) * (V(1)+V(n+1)+2*add);
fprintf('\nTrapezoid Formula = T(n)-T(0)/2n x {V(0)+V(10)+2(V(1)+V(2)...V(9))}\n');
fprintf('\nDistance covered in 10s = %.5f\n',dist);

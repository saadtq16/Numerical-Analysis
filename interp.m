data=[40.12 66.78 80.17 86.71 80.77 66.78 44.41 10.51 -32.60];
t=(0:8);
line = polyfit(t,data,2);
plot(t,data,'ro');
hold on;
plot(t,polyval(line,t),'b-');
txt = sprintf('Best fit line y=%.2ft^2 + %.2ft + %.2f',line(1),line(2),line(3));
legend('Data points',txt);
disp('Initial height = ');
disp(line(3));
disp('Initial velocity = ');
disp(line(2));
disp('Initial accelration = ');
disp(line(1));

p = [line(1) line(2) line(3)];
r = roots(p);
disp('y = 0 at time: ');
display(r(1));

h = polyval(p,2.5);
disp('height at t = 2.5 ');
display(h);

%Max height
deriv = polyder(p);
time = roots(deriv);
max_height = polyval(p,time);
display(max_height);
display('at time: ');
display(time);

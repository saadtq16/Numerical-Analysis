syms func(v)
func(v) = 2+log(v)

x=input('Enter initial guess: ');
tol=input('Enter tolerance: ');
error = 99999;
count = 0
while(error > tol)
fx = func(x);
dify = diff(func);
fx1 = double(dify(x));
x1 = x - double((fx/fx1));
error = abs((x1-x)/x1);
x = x1;
count = count + 1;
end
disp('Root:')
disp(x1);
disp('Iterations:')
disp(count);
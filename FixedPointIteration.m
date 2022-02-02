%Initial conditions
%g(x) = 2 + ln(x)
disp('Equation: g(x) = 2 + ln(x)')
%Take initial guess from user
prompt = 'Initial guess: ';
x0 = input(prompt);
%Max iterations
prompt = 'Maximum iterations: ';
iter = input(prompt);
%Tolerance value
prompt = 'Tolerance: ';
tol = input(prompt);

%Computation
x = x0;
count = 0;
xprev = x0;
for i = 1:iter
    x = 2+log(x);
    err = abs(x-xprev);
    xprev = x;
    count = count + 1;
    if(err < tol)
        break;
    end
end
disp('Root is:')
disp(x);
disp('No. of iterations:')
disp(count);


    
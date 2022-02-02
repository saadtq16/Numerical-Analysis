%Take user inputs
syms x 
syms y
str1 = input('Enter equation 1: ','s');
F1 = inline(str1,'x','y');
str2 = input('Enter equation 2: ','s');
F2 = inline(str2,'x','y');
display(F1);
display(F2);
prompt = 'Enter guess for x: ';
x0 = input(prompt);
prompt = 'Enter guess for y: ';
y0 = input(prompt);
%Guess matrix
M0 = @(x,y) ([x0;y0]);
prompt = 'Enter tolerance: ';
tol = input(prompt);
F0 = @(x,y) ([F1(x,y);F2(x,y)]);
display(F0);
%Formulating Jacobian matrix
j1 = diff(F1(x,y),x);
j2 = diff(F1(x,y),y);
j3 = diff(F2(x,y),x);
j4 = diff(F2(x,y),y);
J = @(x,y) ([j1,j2;j3,j4]);
display('Jacobian matrix: ');
display(J(x0,y0))

%formula
M = M0 + (inv(J(x0,y0)))*F0(x0,y0);

display(M)

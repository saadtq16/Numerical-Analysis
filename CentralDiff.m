%Task 1

%creating dataset
t = [200 202 204 206 208 210];
O = [0.75 0.72 0.70 0.68 0.67 0.66];
r = [5120 5370 5560 5800 6030 6240];
xi = 206;

%create a difference table
D_O = zeros(6,8);
D_r = zeros(6,8);

D_O(:,1) = t(:);
D_O(:,2) = O(:);
D_r(:,1) = t(:);
D_r(:,2) = r(:);

%Performing on O - theeta

%calculate s and y0
middle = (length(t) / 2);
mid = t(middle);
run = t(2) - t(1);
%independent variable
%s = (xi - mid) / run; 
syms s
y0 = O(middle);

%filling difference table
col_index = 0;
tracker = 0;
for i = length(O):-1:1
    for j = 1:(i-1)
        D_O(j,(3 + col_index)) = D_O(j+1,(2 + tracker)) - D_O(j,(2 + tracker));
    end
    col_index = col_index + 1;
    tracker = tracker + 1;
end
disp('Central difference table for Theta:');
disp(D_O)

%applying Stirling's Central Difference Formula
odd = 1;
even = 2;
inc = 1;
iter = 0;
rec1 = s;
rec2 = (s*s);
for i = 3:2:(length(O))
    prod = ((D_O((middle - 1), i) + D_O((middle + 1 - iter), i)) / 2) * (rec1 / factorial(odd));
    term = (rec2 / factorial(even)) * D_O((middle - 1), i+1);
    y0 = y0 + prod + term;
    rec1 = rec1 * ((s*s) - (inc*inc));
    rec2 = rec2 * ((s*s) - (inc*inc));
    odd = odd + 2;
    even = even + 2;
    middle = middle - 1;
    if iter > 0
        inc = inc + 1;
    end
    iter = iter + 1;
end
fprintf('Interpolating polynomial for Theta: \n%s\n',y0);
f_O(s) = y0;
T = vpa(f_O((xi - mid) / run));
df_O(s) = diff(y0);
fprintf('\nValue of Theta at t = 206 => %.4f\n\n',T);
fprintf('First derivative polynomial for Theta:\n');
disp(df_O(s));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Performing on r - radius%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%calculate s and y0
middle = (length(t) / 2);
mid = t(middle);
run = t(2) - t(1);
%independent variable
%s = (xi - mid) / run; 
syms s
yR = r(middle);

%filling difference table
col_index = 0;
tracker = 0;
for i = length(O):-1:1
    for j = 1:(i-1)
        D_r(j,(3 + col_index)) = D_r(j+1,(2 + tracker)) - D_r(j,(2 + tracker));
    end
    col_index = col_index + 1;
    tracker = tracker + 1;
end
disp('Central difference table for Radius:');
disp(D_r);

%applying Stirling's Central Difference Formula
odd = 1;
even = 2;
inc = 1;
iter = 0;
rec1 = s;
rec2 = (s*s);
for i = 3:2:(length(O))
    prod = ((D_r((middle - 1), i) + D_r((middle + 1 - iter), i)) / 2) * (rec1 / factorial(odd));
    term = (rec2 / factorial(even)) * D_r((middle - 1), i+1);
    yR = yR + prod + term;
    rec1 = rec1 * ((s*s) - (inc*inc));
    rec2 = rec2 * ((s*s) - (inc*inc));
    odd = odd + 2;
    even = even + 2;
    middle = middle - 1;
    if iter > 0
        inc = inc + 1;
    end
    iter = iter + 1;
end
fprintf('Interpolating polynomial for Radius: \n%s\n',yR);
f_r(s) = yR;
R = vpa(f_r((xi - mid) / run));
df_r(s) = diff(yR);
fprintf('\nValue of r at t = 206 => %.4f\n\n',R);
fprintf('First derivative polynomial for Radius:\n');
disp(df_r(s));

%deriving vectors eR and eT
eR = cos(T) + sin(T);
eT = cos(T) - sin(T);
fprintf('\neR = %.4f\n',eR);
fprintf('\neT = %.4f\n',eT);

%computing velocity from first derivative
v1 = vpa(df_r((xi - mid) / run) * (1/run));
v2 = vpa(df_O((xi - mid) / run) * (1/run));
vel = (v1 * eR) + R * v2 * eT;
fprintf('\nvelocity = (dr/dt)*eR + r * (dO/dt)*eT')
fprintf('\n\nvelocity = %.2f\n',vel);

%computing acceleration from second derivative
fprintf('\n\nSecond derivative polynomial for Theta:\n');
d2f_O(s) = diff(df_O);
disp(d2f_O(s));

fprintf('\n\nSecond derivative polynomial for Radius:\n');
d2f_r(s) = diff(df_r);
disp(d2f_r(s));

fprintf('\nacceleration = {(d2r/dt2) - r*(dO/dt)^2}*eR + {r*(d2O/dt2) + 2*(dr/dt)*(dO/dt)}*eT\n');
a1 = vpa(d2f_r((xi - mid) / run) * (1/(run*run)));
a2 = vpa(d2f_O((xi - mid) / run) * (1/(run*run)));
acc = (a1 - (R*(v2*v2)))*eR + ((R*a2) + (2*v1*v2))*eT;
fprintf('\n\nacceleration = %.2f\n',acc);


disp('Velocity equation:')
fprintf('\n(%s * (cos(%.4f)+sin(%.4f))) + %.2f * \n(%s)\n * (cos(%.4f)-sin(%.4f)))\n\n',df_r(s),T,T,R,df_O(s),T,T);

disp('Acceleration equation:')
fprintf('\n((%s) -\n%.2f*\n(%s)^2)\n*(cos(%.4f)+sin(%.4f)) + \n{%.2f * (%s)\n + 2 *(%s)*\n(%s)}*\n(cos(%.4f)+sin(%.4f))\n\n',d2f_r(s),R,df_O(s),T,T,R,d2f_O(s),df_r(s),df_O(s),T,T);
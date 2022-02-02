%creating dataset
t = [200 202 204 206 208 210];
O = [0.75 0.72 0.70 0.68 0.67 0.66];
r = [5120 5370 5560 5800 6030 6240];

h = t(2) - t(1);
target = 206;

%%%%%%%%%%%%%% using three point midpoint formula %%%%%%%%%%%%%%
for i=1:length(t)
   if t(i) == target
       index = i;
   end
end

% v = dr/dt * er + r * dO/dt * eO
syms eR;
syms eT;
R = r(index);

%calculating dr/dt 
dr = (1/(2*h))*(-r(index-1) + r(index+1));

%calculating dO/dt 
dO = (1/(2*h))*(-O(index-1) + O(index+1));

v = (dr*eR) + (R*dO*eT);
fprintf('Velocity at t = 206 using three-point formula => %s\n',vpa(v));

%calculating acceleration

%calculating d2r/dt 
d2r = (1/(h*h))*(r(index-1) - 2*r(index) + r(index+1));

%calculating d2O/dt 
d2O = (1/(h*h))*(O(index-1) - 2*O(index) + O(index+1));

a = (d2r - R*(dO*dO))*eR + (R*d2O + 2*dr*dO)*eT;
fprintf('\nAcceleration at t = 206 using three-point formula => %s\n',vpa(a));

%%%%%%%%%%%%%% using five point midpoint formula %%%%%%%%%%%%%%

%calculating dr
dr_t = (1/(12*h)) * (r(index-2) - 8*r(index-1) + 8*r(index+1) - r(index+2));
dr = round(dr_t,2);

%calculating dO
dO = (1/(12*h)) * (O(index-2) - 8*O(index-1) + 8*O(index+1) - O(index+2));

v5 = (dr*eR) + (R*dO*eT);
fprintf('\nVelocity at t = 206 using five-point formula => %s\n',vpa(v5));

%calculating acceleration

%calculating d2r/dt 
d2r_t = (1/(12*h*h)) * (-r(index-2) + 16*r(index-1) - 30*r(index) + 16*r(index+1) - r(index+2));
d2r = round(d2r_t,2);

%calculating d2O/dt 
d2O = (1/(12*h*h)) * (-O(index-2) + 16*O(index-1) - 30*O(index) + 16*O(index+1) - O(index+2));

a5 = (d2r - R*(dO*dO))*eR + (R*d2O + 2*dr*dO)*eT;
fprintf('\nAcceleration at t = 206 using five-point formula => %s\n',vpa(a5));

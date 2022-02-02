%Newton’s Backward Difference Formula MATLAB Program
 
x=[1.0	1.1	1.2	1.3	1.4	1.5]; % inputting the values of x 
fx=[2.0	2.1	2.3	2.7	3.5	4.5]; % inputting the value of y 
dt=zeros(6,7); % declaring function 
for i=1:6 % stating loop 
dt(i,1)=x(i); 
dt(i,2)=fx(i);
end
n=5; 
for j=3:7
 for i=1:n % using for loop 
 dt(i,j)=dt(i+1,j-1)-dt(i,j-1) % defining dt 
 end
 n=n-1;
 end
h=x(2)-x(1) % finding the value of h
xp=1.45; % defining xp
for i=1:6
q=(xp-x(i))/h;
if (q>0&&q<1)
 p=q;
 end
 end
 p
 l=xp-(p*h)
 for i=1:6
 if(l==x(i))
 r=i;
 end
 end
% finding different value of y
 
 f0=fx(r);
 f01=dt((r-1),3);
 f02=dt((r-2),(3+1));
 f03=dt((r-3),(3+2));
 f04=dt((r-4),(3+3));
%using backward difference formula 
 
 fp=(f0)+((p*f01)+(p*(p+1)*f02)/(2)) + ((p*(p+1)*(p+2)*f03)/(6))
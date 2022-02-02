t=[200 202	204	206	208	210];
v=[0.75 0.72 0.70 0.68 0.67 0.66];
dt=zeros(6,6);
for i=1:6
dt(i,1)=x(i);
dt(i,2)=v(i);
end
n=4;
for j=3:6 
for i=1:n
dt(i,j)=dt((i+1),(j-1))-dt(i,(j-1))
end
n=n-1;
end
h=t(2)-t(1)
tp=206;
syms q;
%for i=1:6
%q=(tp-t(i))/h;
%if(q>-1&&q<1)
p=q;
%end
%end
%p
l=tp-(p*h)
for i=1:6 
if(l==t(i))
r=i;
end
end 
f0=v(r);
f11=dt((r-1),3);
f12=dt((r+1),3); 
f02=dt((r-1),4); 
f31=dt((r-2),5); 
f32=dt((r-1),5); 
f04=dt((r-2),6); 
fp(q)= f0+((p*(f11+f12))/2)+(((p*p)*f02)/2)+((p*((p*p)-1)*(f31+f32))/12)+(((p*p)*((p*p)-1)*f04)/24)

df(q) = diff(fp);
df2(q) = diff(df);

function [f, p, pval] = NumDiff(x, y, xi, c)
 
if (nargin < 3)
   c = 0;
end
 
pval = length(x)*(0+1) - 1;
 
n = length(x)-1;
D = zeros(n+1,n+1);
D(:,1) = y(:);
 
h = x(2)-x(1);
 
for i = 1:n
   for j = 1:i
      D(i+1,j+1) = D(i+1,j)-D(i,j);
   end
end
 
if (c == 0)
   if (xi < x(1))
      c = 2;
   elseif (xi > x(ceil((n+1)/2)) && xi <= x(n+1))
      c = 2;
   else
      c = 1;
   end
end
 
switch c
   case 1
      % forward difference interpolation
      syms q
      p = diag(D);
      %q = (xi-x(1))/h;
      yi = p(1);
      for i = 1:length(p)-1
         term = 1;
         for k = 0:(i-1)
           term = term*(q-k);
         end
         term = term/factorial(i);
         yi = yi + term*p(i+1);
         %diff(yi)
         %disp(yi)
      end
      f(q) = diff(yi)
      disp(f(q))
      disp(f(0.2))
   case 2
      % backward difference interpolation
      p = D(n+1,:).';
      q = (xi-x(n+1))/h;
      yi = p(1);
      for i = 1:length(p)-1
         term = 1;
         for k = 0:(i-1)
           term = term*(q+k);
         end
         term = term/factorial(i);
         yi = yi + term*p(i+1);
      end
   
end

clear all

b=807; 

f = inline('(2.+0.001*807)*exp(x/6.)-(0.5+0.001*807)*sin(pi*x/3.)','x');  % 

x = [-2 -1 1 2];
n = length(x)-1;

fval = zeros(1,n+1);

% Now get the function-values for the given data-points (or they could be read in, instead)

for i = 1:(n+1)
  fval(i) = f(x(i));
end


% Calculate the coefficients of the Lagrange polynomials based on the points in the vector x

L = zeros(n+1,n+1);

for k = 1:(n+1)
  V=1;
  for j=1:(n+1)
    if (k ~=j)
      V = conv(V,poly(x(j)))/(x(k)-x(j));
    end  
  end
  L(k,:) = V;
end


% Now we can calculate the coefficients of the interpolating polynomial

C = fval*L;



% Calculate the data for the two plots

m = 100;
lower = min(x) - 0.4;
upper = max(x) + 0.4;
diff = upper - lower;

h = diff / m;

xx = zeros(m+1,1);
true_f = xx;
f_interp = xx;

for i = 1:(m+1)
  xx(i) = lower + (i-1)*h;
  true_f(i) = f(xx(i));
  f_interp(i) = polyval(C,xx(i));
end

plot(xx,true_f,'LineWidth',2);

hold on;

plot(xx,f_interp,'-r','LineWidth',2);

hold on;

plot(x,fval,'gd');



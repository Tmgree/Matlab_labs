
clear 

t_begin = 0.0;
t_end = 1.0;
tspan = [t_begin t_end];

y0 = 1.0;
Rtol = 1.0e-6;

options = odeset('RelTol',Rtol);

[T Y] = ode23(@testfun,tspan,y0,options);

[N,M] = size(Y);

N1 = N - 1;

disp(' ')
disp('RelTol:')
disp(Rtol)
disp(' ')

disp('Number of steps:')
disp(N1)
disp(' ')

disp('t-values:')
disp(T)
disp(' ')

disp('y-values:')
disp(Y)
disp(' ')

figure(1)
plot(T,Y)

for i=1:N
yana(i,1) = exp(-0.5*T(i,1)^2);
diff(i,1) = yana(i,1) - Y(i,1);
end

figure(2)
plot(T,Y,T,yana)

figure(3)
plot(T,diff)



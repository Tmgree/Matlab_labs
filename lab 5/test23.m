
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


plot(T,Y)


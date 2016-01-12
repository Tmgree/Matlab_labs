% This programme solves y=y(t) and x=x(t) for question 2
clear 



t_begin = 0.0;
t_end = 200.0;
tspan = [t_begin t_end];

y0 = [0.5; 0.5];
Rtol = 1.0e-6;

options = odeset('RelTol',Rtol);

[T Y] = ode23(@q2functions,tspan,y0,options);

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

figure(2)
plot(Y(:,1),Y(:,2))



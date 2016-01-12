
% ##################################
% Heun's Third-order Rule for ODEs #
% ##################################


f = inline('t^2-y','y','t');  % This is the function on the RHS of the ODE
fana = inline('t^2-2*t+2+(alpha-17.)*exp(-t-3.)','t','alpha'); % analytical solution to differential equation 


% Set up the initial data and the end value for 't':
t_begin = -3.;
t_end = 3.;
d=807;
alpha=0.01*d;
y0 = alpha;


% Choose the number of points:
N = 1000;


% Set up the vectors to hold the 't' and 'y' values as they are calculated:
t = zeros(N+1,1);
y = t;


% Put the initial data into the first elements of the vectors 't' and 'y':
t(1) = t_begin;
y(1) = y0;


% Calculate the step-length:
h = (t_end - t_begin)/N;



% Now carry out Heun's Third-order Rule:

for k = 1:N  % Be careful not to confuse 'k' (the loop-counter) with k1, k2 or k3 (needed in Heun's Third-order Rule)
  k1 = f(y(k),t(k));
  tempy = y(k) + h*k1/3.0;
  tempt = t(k) + h/3.0;
  k2 = f( tempy, tempt );
  tempy = y(k) + 2*h*k2/3.0;
  tempt = t(k) + 2*h/3.0;
  k3 = f( tempy, tempt );
  y(k+1) = y(k) + h*(k1/4.+3/4.*k3);
  t(k+1) = t(k) + h;
end


% Print the final values:
disp(' ')
disp(' ')
disp('Final value of t:')
disp(t(N+1))
disp(' ')
disp('Final value of y:')
disp(y(N+1))
disp(' ')
disp('Number of steps:')
disp(N)


% Only use these last steps if the analytical solution of the ODE is known 
% (otherwise, put % at the start of each line to make them comments)

truey = fana(t(N+1),alpha);
diff = y(N+1) - truey;
disp('True value of y:')
disp(truey)
disp(' ')
disp('Difference between computed and true values:')
disp(diff)





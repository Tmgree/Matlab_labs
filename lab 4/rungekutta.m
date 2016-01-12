
% ##################################
% Heun's Third-order Rule for ODEs #
% ##################################


f = inline('t^2-y','y','t');  % This is the function on the RHS of the ODE

d=807;
alpha=0.01*d;
beta=0.95+0.0001*d;
% Set up the initial data and the end value for 't':
t_begin = -3.;
t_end = 3.;
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
h = (t_end-t_begin)/N;



% Now carry out Heun's Third-order Rule:

for k = 1:N  % Be careful not to confuse 'k' (the loop-counter) with k1, k2 or k3 (needed in Heun's Third-order Rule)
  k1 = f(y(k),t(k));
  tempy = y(k) + h*k1/2.0;
  tempt = t(k) + h/2.0;
  k2 = f(tempy,tempt);
  tempy = y(k)+(h*k2)/2.0;
  tempt = t(k) + h/2.0;
  k3 = f(tempy,tempt);
  tempy = y(k)+(h*k3);
  tempt = t(k) + h;
  k4 = f(tempy,tempt);
  y(k+1) = y(k)+(h/6.0)*(k1+2*k2+2*k3+k4);
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

truey = t(N+1)^2-2*t(N+1)+2+(alpha-17)*exp(-t(N+1)-3);
diff = y(N+1) - truey;
disp('True value of y:')
disp(truey)
disp(' ')
disp('Difference between computed and true values:')
disp(diff)





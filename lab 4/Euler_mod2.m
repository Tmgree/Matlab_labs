
% #########################
% Euler's Method for ODEs #
% #########################

f = inline('-t^2*y','y','t');  % This is the function on the RHS of the ODE


% Set up the initial data and the end value for 't':
t_begin = 0.0;
t_end = 1.5;
y0 = 1.0;



step=[10 100 1000 10000];





nn=size(step);


nnn=nn(1,2);

nnn

error1=zeros(1,nnn);

yn=zeros(nnn,

for kk=1:nnn


% Choose the number of incraments:
N = step(1,kk);
N

% Set up the vectors to hold the 't' and 'y' values as they are calculated:
t = zeros(N+1,1);
y = t;


% Put the initial data into the first elements of the vectors 't' and 'y':
t(1) = t_begin;
y(1) = y0;


% Calculate the step-length:
h = (t_end-t_begin)/N;



% Now carry out Euler's method:

for k = 1:N
  yd = f(y(k),t(k));
  y(k+1) = y(k)+yd*h;
  t(k+1) = t(k) + h;
end


for k=1:N
yn(k,kk)=y(k);

end


% Print the final values:
disp(' ')
%disp(' ')
disp('Final value of t:')
disp(t(N+1))
%disp(' ')
disp('Final value of y:')
disp(y(N+1))
%disp(' ')
disp('Number of steps:')
disp(N)


% Only use these last steps if the analytical solution of the ODE is known 
% (otherwise, put % at the start of each line to make them comments)

truey = exp(-(t_end^3)/3);
diff = y(N+1) - truey;
disp('True value of y:')
disp(truey)
%disp(' ')
disp('Difference between computed and true values:')
disp(diff)
error1(1,kk)=log(diff);


end

yn




plot(step,error1);

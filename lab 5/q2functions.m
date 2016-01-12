
function dy = q2functions(t,y);

b=807.;
m=9.5+0.001*b;
c=5.5-0.001*b;
kbar=(m+c)/(m-c); 
k=0.75*kbar;

% y and dy are vector columns equivalent to f(t,y) of the system of equations
% y(1,1) = x in the original question 
% y(2,1) = y in the original question 

dy = zeros(2,1); 
dy(1,1) = y(1,1)*(1.-y(1,1)/k)-(m*y(1,1)*y(2,1))/(1.+y(1,1));
dy(2,1) = -c*y(2,1)+(m*y(1,1)*y(2,1))/(1.+y(1,1));


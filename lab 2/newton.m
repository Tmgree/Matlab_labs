
 % #####################################
 % Newton's Method  (general function) #
 % #####################################
  
 f = inline('x*cosh(10/x)-x-28');        % Code for the function being "solved" is entered here
 fdash = inline('cosh(10/x)+x*sinh(10/x)*(-10/(x^2))-1');    % So what code goes here?

 it_limit = 50000000;
 
 x1 = 5;  % Starting guess - change this if you need to
 
 tol = 0.000001;
 
 disp(' ');
 disp('      x')
 disp(x1)
 
 x2 = x1-f(x1)/fdash(x1);  % NEWTON'S method
 i = 1;
 
 disp(x2)
 
 while ((abs(x2-x1) > tol) & (abs(f(x2)) > tol) & (i < it_limit))
   x1 = x2;
   i = i + 1;
   x2 = x1-f(x1)/fdash(x1);  % NEWTON'S method
   disp(x2)
 end
 
 if (i >= it_limit)
   disp('Iterations limit exceeded')
 else
   disp('Solution is:')
   disp(x2)
   disp('Number of iterations required:')
   disp(i)
 end
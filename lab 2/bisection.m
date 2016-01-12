 
 % ######################################
 % Bisection Method  (general function) #
 % ######################################
  
 f = inline('exp(x)-2.0-x');  % The definition of the function is given here

 it_limit = 5000000;
 
 tol = 0.000001;
 i = 1;
 
 x1 = -2.6;
 x2 = -1.4;
 xx = [x1,x2];
 f1 = f(x1);
 f2 = f(x2);
 minf = min(abs(f1),abs(f2));
 disp(' ');
 disp('      x1       x2')
 disp(xx)
 
 while ((abs(x2-x1) > tol) & (minf > tol) & (i < it_limit))
 
   x3 = 0.5*(x1+x2) ;
   f3 = f(x3);

   if (f2*f3 < 0)
     x1 = x3;
     f1 = f3;
   else
     x2 = x3;
     f2 = f3;
   end

   i = i + 1;
   minf = min(abs(f1),abs(f2));
   xx = [x1,x2];
   disp(xx)
 end
 
 if (i >= it_limit)
   disp('Iterations limit exceeded')
 else
   disp('Solution is:')
   if (abs(f1) < abs(f2))
     disp(x1)
   else
     disp(x2)
   end
   disp('Number of iterations required:')
   disp(i)
 end
         
 

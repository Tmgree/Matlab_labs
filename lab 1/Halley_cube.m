
 % ########################################
 % Halley's Method for finding CUBE roots
 % ########################################
 
 clear
 format long
 a = 202807;
 xstar = a^(1.0/3.0);  % Just used for calculating errors

 it_limit = 30;
 
 xkeep = zeros(1,it_limit);
 errors = xkeep;
 it_numbers = xkeep;
 
 % Starting estimate:
 
 x1 = a / 3.0
 
 
 xkeep(1) = x1;
 log_errors(1) = log10(abs(xkeep(1) - xstar));
 it_numbers(1) = 1;
 
 tol = 0.000001;
 
 i = 2;
 
 x2 = x1 * (x1^3 + 2.0 * a) / (2.0 * x1^3 + a)
 xkeep(i) = x2;
 log_errors(i) = log10(abs(xkeep(i) - xstar));
 it_numbers(i) = i;
 
 while ((abs(x2-x1) > tol) & (i < it_limit))
   x1 = x2;
   i = i + 1;
   
   x2 = x1 * (x1^3 + 2.0 * a) / (2.0 * x1^3 + a)
   xkeep(i) = x2;
   log_errors(i) = log10(abs(xkeep(i) - xstar));
   it_numbers(i) = i;
 end
 
 for  j = 1:i
   yy(j) = log_errors(j);
   xx(j) = it_numbers(j);
 end
 
 disp(' ')
 disp('No. of iterations:')
 disp(i)
 
 disp('Final estimate of root:')
 disp(xkeep(i))
 
 plot(xx,yy)  
 

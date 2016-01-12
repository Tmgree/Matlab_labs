

 % ########################################
 % Simple version of Gaussian Elimination #
 % ########################################
 
 d = 7;
p = 5;

alpha = zeros(p+1,1);

A = zeros(p+1,p+1);

for i = 1:p+1
  alpha(i) = 1/(i+3-0.1*d);
end

for i = 1:p+1
  A(1,i) = 1.0;
  for j = 1:p
    A(j+1,i) = alpha(i)^j;
  end
end



for i = 1:p+1
  alpha(i) = 1/(i+3-0.1*d);
  z(i)=p+2-i;            %define the z vector
end

A

b=A*(z)';

    
   % Elimination phase
   
   for i = 1:(n-1)   % Eliminate x_i
     for j = (i+1):n
       mult = -A(j,i)/A(i,i);  
       for k = i:n
         A(j,k) = A(j,k) + mult*A(i,k);  % COMPLETE THIS LINE
       end
       b(j) = b(j) + mult*b(i);    % COMPLETE THIS LINE
     end
   end
   A
   
   % Back substitution phase
   
   x = zeros(n,1);
   x(n) = b(n) / A(n,n); 
   for i = (n-1):-1:1
     sum = 0.0;
     for j = (i+1):n
       sum = sum + A(i,j) * x(j);
     end
     x(i) = (b(i)-sum)/A(i,i); 
   end
   
   % Display the results
   
   disp('Solution is: ')
   x
   
  
   
   AA*x-bb
   
   inv(AA)*bb
   

 
 
 


 % ########################################
 % Simple version of Gaussian Elimination #
 % ########################################
 
 %load Adata A b
 nn=10;
 A=rand(nn);
 b=rand([nn,1]);
 [m,n] = size(A)
 if (m ~= n) 
   disp('A must be square')
 else
     
     AA=A;
     bb=b;
   
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
   x;
   
  
   
   AA*x-bb;
   
   x-inv(AA)*bb
   
   
 end
 
 
 
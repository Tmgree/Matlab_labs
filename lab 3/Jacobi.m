

 % #################
 % Jacobi's Method #
 % #################
 
 load Adata A b
 [m,n] = size(A)
 if (m ~= n) 
   disp('A must be square')
 else
   
   x = zeros(n,1);
   
   prev_x = ones(n,1);
   diff = norm(x - prev_x);
   
   iterations = 0;
   
   while ((iterations < 100) & (diff > 0.000001))
     
     iterations = iterations + 1; 
     prev_x = x;
     
     for i = 1:n
       sum = 0;
       for j = 1:(i-1) 
         sum = sum + A(i,j) * x(j);    % COMPLETE THIS LINE
       end  
       for j = i+1:n                    % COMPLETE THIS LINE
         sum = sum + A(i,j) * x(j);    % COMPLETE THIS LINE
       end
       
       x(i) = (b(i)-sum)/A(i,i); 
     end 
     diff = norm(x - prev_x);
   end   % of while loop
   
   disp('Solution is: ')
   x
   disp(' ')
   disp('Number of iterations: ')
   disp(iterations)
   
 end
 
 
 
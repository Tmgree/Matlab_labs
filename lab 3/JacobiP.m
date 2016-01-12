

 % #################
 % Jacobi's Method #
 % #################
 
 %load Cdata A b
 eps=10e-50
 n=1000;
 A=rand(n);
 b=rand([n,1]);
 A=A-0.5;
 
 for i=1:n
     sum=0;
     
     for j=1:i-1
     sum=sum+abs(A(i,j));
     end
     
     for j=i+1:n
     sum=sum+abs(A(i,j));
     end
     
     
     A(i,i)=sign(A(i,i))*sum*10.0;
     
 end
 
 
 
 
 
 [m,n] = size(A);
 if (m ~= n) 
   disp('A must be square')
 else
   
   x = zeros(n,1);
   
   prev_x = ones(n,1);
   diff = norm(x - prev_x);   
   
   e=A*x-b;
   
   ediff=norm(e);
   
   iterations = 0;
   
   disp(['Iteration= ' int2str(iterations) ' Diff= ' num2str(diff)   ' norm(e)= ' num2str(norm(e))]);
     
   diffall=max(diff, ediff);
   
   
   while ( ( (iterations < 100000) & (diffall > eps) ) ),
     
     iterations = iterations + 1; 
     prev_x = x;
     
     for i = 1:n
       sum = 0;
       for j = 1:(i-1) 
         sum = sum + A(i,j) * x(j);    % COMPLETE THIS LINE
       end  
       for j = i+1:n                  % COMPLETE THIS LINE
         sum = sum + A(i,j) * x(j);    % COMPLETE THIS LINE
       end
       
       x(i) = (b(i)-sum)/A(i,i); 
     end 
     diff = norm(x - prev_x);
     
     e=A*x-b;
     ediff=norm(e);
   
    diffall=max(diff, ediff);
     
     disp(['Iteration= ' int2str(iterations) ' Diff= ' num2str(diff)   ' norm(e)= ' num2str(norm(e))]);
     
     
   end   % of while loop
   
   
  
   
   disp('Solution is: ')
   x
   disp(' ')
   disp('Number of iterations: ')
   disp(iterations)
   
 end
 
 
 
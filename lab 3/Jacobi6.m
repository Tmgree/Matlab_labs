

 % #################
 % Jacobi's Method #
 % #################
 
 %load Cdata A b
 eps=1.e-6
 
 
 
 cc=3;
 dd=7;
 bb=2*cc;
 aa=7*cc+0.3*dd;
 
 z0=zeros(5,5);
 
 F=[2*aa bb 0 0 0;bb 2*aa -bb 0 0;0 -bb 2*aa bb 0;0 0 bb 2*aa -bb;0 0 0 -bb 2*aa];
 
 G=[cc 0 0 0 0;0 -cc 0 0 0;0 0 -cc 0 0;0 0 0 -cc 0;0 0 0 0 cc];
 
 M=[F G z0 z0 z0;G F -G z0 z0;z0 -G F G z0;z0 z0 G F -G;z0 z0 z0 -G F];
 
 z=rand([25,1]);
 
 for i=1:25
 z(i,1)=13-i;
 end
 
 v=M*z;
 
 
 A=M;
 b=v;
 
  
 
 
 
 
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
 
 
 
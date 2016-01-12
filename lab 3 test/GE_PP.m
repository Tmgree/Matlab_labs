

 % ###########################################
 % Gaussian Elimination with partial pivoting#
 % ###########################################
 
 load Adata A b
 [m,n] = size(A)
 if (m ~= n) 
   disp('A must be square')
 else
   
   % Elimination phase
   
   for i = 1:(n-1)   % Eliminate x_i
     
     
     % First, find the largest of the potential pivots
     % Start from the i_th row and work downwards
     
     pivot = abs(A(i,i));
     pivot_row = i;
     for j = (i+1):n
       if (abs(A(j,i)) > pivot)
         pivot = abs(A(j,i));
         pivot_row = j; 
       end
     end
     
     
     % If the chosen row is not the i_th row, swap the equations
     
     if (i ~= pivot_row)
       for k = 1:n
         temp = A(i,k);
         A(i,k) = A(pivot_row,k); 
         A(pivot_row,k) = temp; 
       end
       temp = b(i);
       b(i) = b(pivot_row); 
       b(pivot_row) = temp; 
     end     
     
     
     % Now proceed with the elimination of x_i
     
     for j = (i+1):n
       mult = -A(j,i)/A(i,i); 
       for k = i:n
         A(j,k) = A(j,k) + mult*A(i,k);
       end
       b(j) = b(j) + mult*b(i);
     end
   end
   
   
   % Back substitution phase
   
   x = zeros(n,1);
   x(n) = b(n) / A(n,n); 
   for i = (n-1):-1:1
     sum = 0;
     for j = (i+1):n
       sum = sum + A(i,j) * x(j);
     end
     x(i) = (b(i)-sum)/A(i,i); 
   end
   
   % Display the results
   
   disp('Solution is: ')
   x
   
 end
 
 
 
d=7;
p = 5;

alpha = zeros(p+1,1);
z=zeros(p+1,1);    %creating z vector, size


V = zeros(p+1,p+1);

for i = 1:p+1
  alpha(i) = 1/(i+3-0.1*d);
  z(i)=p+2-i;            %define the z vector
end

for i = 1:p+1             %defining the v vector
  V(1,i) = 1.0;
  for j = 1:p
    V(j+1,i) = alpha(i)^j;
  end
end

%defining w vector

% checking solution using matrix inverse


w=V*z;
xstar=inv(V)*w;
error1=xstar-z

%copying v and w into A and b

A=V;
b=w;

%checking that matrix A is square

[m,n] = size(A)
 if (m ~= n) %---------1------------
   disp('A must be square')
 else      %---------1------------
     
 %      BEGINNING of SIMPLE GAUSS NUMERICAL PROCEDURE  
     
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
   
   xsimple=x; %copied solution
   
   error_simple=xsimple-z
  
%      END of SIMPLE GAUSS NUMERICAL PROCEDURE
   
   
%copying v and w into A and b

A=V;
b=w;

%checking that matrix A is square

[m,n] = size(A)
 if (m ~= n) %---------1------------
   disp('A must be square')
 else      %---------2------------
     
 
   
   
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
 
 

%      end of Partial GAUSS NUMERICAL PROCEDURE
 end        %---------2------------

xpivoting=x;

error_pivoting=xpivoting-z

norm_error1=norm(error1)
norm_error_simple=norm(error_simple)
norm_error_pivoting=norm(error_pivoting)


eps=2
iteration=0
while (eps+1>1)
    eps=eps/1.0001;
  iteration=iteration+1;
end
eps=eps*2;
eps





   
   
   
 end %---------1------------
   
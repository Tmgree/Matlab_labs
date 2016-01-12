d = 7;
p = 5;

alpha = zeros(p+1,1);

V = zeros(p+1,p+1);

for i = 1:p+1
  alpha(i) = 1/(i+3-0.1*d);
end

for i = 1:p+1
  V(1,i) = 1.0;
  for j = 1:p
    V(j+1,i) = alpha(i)^j;
  end
end

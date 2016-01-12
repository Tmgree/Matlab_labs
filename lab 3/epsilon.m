eps=2
a=1e-5
iteration=0
while (eps+a>a)
    eps=eps/1.1;
  iteration=iteration+1;
end
eps=eps*2;
eps
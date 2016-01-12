clear all;
% Linear Interpolation using Least Squares Method
%
% n - No of data points (Xi,Yi)
% m - Degree of polynomial which is fitting data 
% m MUST BE EQUAL OR LESS THAN (n-1) 
%
m = 3;
%
n = 4;  
x=[6.2; 6.6; 7.2; 7.4];
y=[17.8; 19.2; 21.0; 22.0];
%
for i=1:n
	for j=1:m+1
	xx(i,j) = x(i,1)^(j-1.);
	end
end
%
if m < n-1
aa = inv(xx'*xx)*xx'*y;
elseif m == n-1
aa = inv(xx) * y;
else
disp('WARNING: degree of polynomial to high, reduce m parameter to be equal or less than n!');
end
disp('Error of the curve fit line')
yerror = y - xx * aa
%
np=1000;
a=min(x);
b=max(x);
dx=(b-a)/(np-1);
for i=1:np
xfit(i,1) = a + dx * (i-1);
yfit(i,1) = 0.;
	for j=1:m+1
	yfit(i,1) = yfit(i,1) + aa(j,1) * xfit(i,1)^(j-1.);
	end
end
%
xt = 6.8;
yt = 0.;
for j=1:m+1
	yt = yt + aa(j,1) * xt^(j-1.);
end
%
figure(1)
plot(x,y,'rx');
xlabel('X data points');
ylabel('Y data points');
title('Interpolation by Least Squares Method');
hold on
plot(xfit,yfit,'b')
hold on
plot(xt,yt,'gd')
hold off










function c = root(n)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

for j=0:n-1
    x0=-cos((2*j+1)/(2*n+1)*pi);
    
for i=1:1e7
    
[y,dy]=leg(n,x0);
if abs(dy)<1e-6
    error("BYE!")
end
if abs(y)<1e-6
    break;
else
    x=x0-y/dy;
    x0=x;
end
end

c(j+1)=x0;
    
end

end

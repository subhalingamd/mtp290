function x1 = leg(n)
    %LEG Summary of this function goes here
    %   Detailed explanation goes here
    
    x0 = @(x) 1;
    x1 = @(x) x;
    x0_= @(x) 0;
    x1_= @(x) 1;
    
    for i=1:n-1
        x2= @(x) (x1(x)*(2*i+1)*x-x0(x)*i)/(i+1); 
        x0=x1;
        x1=x2;
        %X{i+1}=@(x) X{i}(x)*(2*i+1)*x-X{i-1}(x)*n;
    end
    x1
end


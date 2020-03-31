function ar = trap1(x,y)
    %TRAP1 Summary of this function goes here
    %   Detailed explanation goes here

    ar=0;
    for i=1:length(y)-1
        ar=ar+0.5*(x(i+1)-x(i))*(y(i)+y(i+1));
    end
   

end
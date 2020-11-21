
function y = improved_euler(y_,x0,y0,h,n)
    %IMPROVED_EULER Summary
    % Using Improved Euler method to solve ODE
    %
    % Input arguments
    %  - y_: y' (a function of x and y)
    %        e.g. @(x,y) (x) is equivalent to y' = x
    %  - x0: Initial value of x
    %  - y0: Initial value of y
    %        e.g. y(x0) = y0 is the initial value for the ODE
    %  - h : The step size
    %  - n : Number of iterations
    %
    % Output arguments
    %  - y : The value of y(x) where x = (x0 + n*h)
    
    % Initialise x and y
    y = y0;
    x = x0;
    
    i = 1;
    while i <= n
        
        % Peform Improved Euler Method
        k1 = y_(x, y);
        k2 = y_(x + h, y + h*k1);
        
        % Update y(x) based on the updates above
        y = y + (k1 + k2) * h/2;
        
        % Update x 
		x = x + h;

        % Increment i [IMPORTANT]
        i = i + 1;
    end    
    
    % Echo y(x)
    fprintf("y(%f) = %f",x,y);
end


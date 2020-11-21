function y = rk4(y_,x,x0,y0,h)
    %RK4 Summary
    % Using classical Runge–Kutta method of fourth order to solve ODE
    %
    % Input arguments
    %  - y_: y' (a function of x and y)
    %        e.g. @(x,y) (x) is equivalent to y' = x
    %  - x : the value of x at which y(x) has to be determined
    %  - x0: Initial value of x
    %  - y0: Initial value of y
    %        e.g. y(x0) = y0 is the initial value for the ODE
    %  - h : The step size
    %
    % Output arguments
    %  - y : The value of y(x)
    
    % Initialise y with initial value y0
    y = y0;
    
    % The number of iterations to make
    n = (x - x0)/h;
    
    i = 1;
    while i <= n
        
        % Apply the formulae
        k1 = h * y_(x0, y);
        k2 = h * y_(x0 + h/2, y + k1/2);
        k3 = h * y_(x0 + h/2, y + k2/2);
        k4 = h * y_(x0 + h, y + k3);
        
        % Update y(x) based on the updates above
        y = y + (k1 + 2*k2 + 2*k3 + k4) / 6;
        
        % Update x 
		x0 = x0 + h;
        
        % Increment i [IMPORTANT]
        i = i + 1;
        
    end
    
    % Echo y(x)
    fprintf("y(%f) = %f",x,y);
    
end


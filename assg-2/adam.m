function [Y,X] = adam(y_,x0,y0,h,a,b)
    %ADAM Summary
    %   Using Adams–Bashforth Prediction and Adams–Moulton Correction
    %   method to solve ODE
    %
    % Input arguments
    %  - y_: y' (a function of x and y)
    %        e.g. @(x,y) (x) is equivalent to y' = x
    %  - x0: Initial value of x
    %  - y0: Initial value of y
    %        e.g. y(x0) = y0 is the initial value for the ODE
    %  - h : The step size
    %  - a : The start point of the interval (same as x0)
    %  - b : The end point of the interval
    %
    % Output arguments
    %  - X : The values of x at which y(x) has to be determined
    %  - Y : The values of y(X)
    %
    % Note: X is obtained from step size
    
    % Compute the number of values of X
    n = (b-a)/h + 1;
    
    % Initilaise X and Y vectors
    X = [a:h:b];
    % [m,n] = shape(X);  
    Y = zeros(1,n);
    
    % Add values of Y based on the initial values
    Y(1) = y0;
    
    i = 2;
    
    % Obtain 3 more values from classical Runge–Kutta method of fourth order
    while i <= 4 && i <= n  % Make sure n >= 4
        evalc('Y(i) = rk4(y_,X(i),x0,y0,h);');   % 'evalc' is used to suppress the output from rk4()

        % Increment i [IMPORTANT]
        i = i + 1;
    end
    
    % Perform Predictor-Corrector steps
    while i <= n
        % Adams–Bashforth Prediction
        Y(i) = Y(i-1) + h*( 55*y_(X(i-1),Y(i-1)) - 59*y_(X(i-2),Y(i-2)) + 37*y_(X(i-3),Y(i-3)) - 9*y_(X(i-4),Y(i-4)) )/24;
        
        % Adams–Moulton Correction
        Y(i) = Y(i-1) + h*( 9*y_(X(i),Y(i)) + 19*y_(X(i-1),Y(i-1)) - 5*y_(X(i-2),Y(i-2)) + y_(X(i-3),Y(i-3)) )/24; % comment this line to skip corrector step, if required
        
        % Increment i [IMPORTANT]
        i = i + 1;
    end
    
    % Echo X and Y(x)
    fprintf("\n\tx\t\ty(x)")
    fprintf("\n\t%f\t%f",[X;Y]);
    
end


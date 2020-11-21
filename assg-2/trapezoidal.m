function ar = trapezoidal(f,a,b,n)
    %TRAPEZOIDAL Summary
    % Trapezoidal rule to compute the integral of f(x) from a to b using n
    % intervals
    %
    % Input arguments
    %  - f  : f(x) (the function whose integral has to be computed)
    %        e.g. @(x) (x) is equivalent to f(x) = x
    %  - a : Lower limit of the integral
    %  - b : Upper limit of the integral
    %  - n : Number of intervals/ordinates
    %
    % Output arguments
    %  - ar: The value of the required integral
    
    
    % Find the length of each strip and each of their endpoints
    % So if a = 0 and b = 4 and n = 4, our desired endpoints of rectangular
    % strips on x-axis would be [0,1,2,3,4]
    h = (b - a) / n;
    x = (a : h : b);
    
    % Compute the values of the function at x
    y = f(x);
    
    % In the Trapezoidal rule, the area (or the value of the integral) is
    % given by SUM[ ((b-a)/n)*(f(x1)+f(x2))/2 ] where x1,x2 denote the 
    % endpoint of each strip on x-axis.
    %
    % When summation is applied, it is easy to observe that the right point
    % of a strip and the left point of the next strip are same and hence
    % their value occur twice except at the beginning and the end.
    ar  = 0.5 * h * (2*sum(y) -y(1)-y(end));
    
    % Echo the value of integral
    fprintf("%f",ar);
end
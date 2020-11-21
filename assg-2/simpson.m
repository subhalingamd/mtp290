function ar = simpson(f,a,b,n)
    %SIMPSON Summary
    % Simpson rule to compute the integral of f(x) from a to b using n
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
    
    % Find the midpoint of the each strip
    x_mid = zeros(1,n);
    i = 1;
    while i<=n
        x_mid(i) = (x(i) + x(i+1))/2;
        i = i + 1;
    end
    
    % Compute the values of the function at x and x_mid
    y = f(x);
    y_mid = f(x_mid);
    
    % The formula is SUM[ ((b-a)/n)*(f(x1)+f(x2)+4f((x1+x2)/2))/6 ] where
    % x1,x2 denote the endpoint of each strip on x-axis.
    %
    % When summation is applied, it is easy to observe that the right point
    % of a strip and the left point of the next strip are same and hence
    % their value occur twice except at the beginning and the end.
    % Moreover, the value at the midpoints are multiplied by 4. 
    ar = h * (2*sum(y) -y(1)-y(end) + 4*sum(y_mid)) / 6;
    
    % Echo the value of integral
    fprintf("%f",ar);
end


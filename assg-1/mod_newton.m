function [c,X] = mod_newton(f,f_,x0,multp,TOL,maxiter)
%MOD_NEWTON Summary
%
%  This method is used to find the root of function with multiplicty > 1
%  to preserve the order of convergence as 2. It is a modification of
%  Newton's method.
%
%  Iteration formula
%   x_{n+1} = x_n - m * f(x_n)/f'(x_n)   (where m is multiplicty)
%
%  Input:
%   - f         :   The function whose roots are to be found
%   - f_        :   The derivative of function f 
%   - x0        :   Initial guess
%   - multp     :   Multiplicity of the root
%   - TOL       :   The tolerance value
%   - maxiter   :   Maximum number of iterations (This is not required in
%                   this assignment though)
%
%  Output:
%   - c         :   The required root c such that |f(c)|<TOL
%   - X         :   A vector containing all the values of x obtained during
%                   iteration (including the guess value)
%
%  Remarks:
%   - X(1)      :   Initial guess
%   - X(end)    :   The required root,i.e., value c such that |f(c)|<TOL 
%                   (if maxiter not exceeded)
%   - Also, i=length(X)-1 after termination (assuming maxiter not exceeded)
%



    % Initialising
    c=x0;               % c=x0 (safety) so that c doesn't go unspecified
    X(1)=x0;             % first element in this vector is the guess element
    i=0;                % No. of iterations

    % Breakpoint: f(current_x)<TOL or i>=maxiter (max iterations exceeded)
    while abs(f(X(i+1)))>=TOL && i<maxiter
    
        % If derivative is 0, divide by 0 not possible - so stop!
        if abs(f_(X(i+1)))==0
            error("Snap... Derivative becomes 0! Kindly try other methods :/");
        end
    
    
        % Follows from iteration formula
        c=X(i+1)-multp*f(X(i+1))/f_(X(i+1));
        X(i+2)=c;
        
        % Increment i
        i=i+1;
    end

    % Not encountered in this assignment and hence not taken care
    % completely
    if i==maxiter
        error("Maximum iterations exceeded!");
    end

    % Printing
    fprintf("Root found at %f",c);
    % fprintf("\nNumber of steps taken: %d",i);

end
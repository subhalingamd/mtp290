function [c,X] = secant(f,g0,g1,TOL,maxiter)
% SECANT Summary
%
% Finding the root using Secant method
%
%  Iteration formula
%   x_{n+1} = x_n - f(x_n)/( f(x_n) - f(x_{n-1}) )*( x_n - x_{n-1} )
%
%  Input:
%   - f         :   The function whose roots are to be found
%   - g0        :   Initial guess 1
%   - g1        :   Initial guess 2
%   - TOL       :   The tolerance value
%   - maxiter   :   Maximum number of iterations (This is not required in
%                   this assignment though)
%
%  Output:
%   - c         :   The required root c such that |f(c)|<TOL
%   - X         :   A vector containing all the values of x obtained during
%                   iteration (including the initial guess values)
%
%  Remarks:
%   - X(1),X(2) :   Initial guesses
%   - X(end)    :   The required root,i.e., value c such that |f(c)|<TOL 
%                   (if maxiter not exceeded)
%   - Also, i=length(X)-2 after termination (assuming maxiter not exceeded)

    % Initialising
    c=g1;               % c=guess_2 (safety) so that c doesn't go unspecified
    X(1)=g0;            % first element in this vector is the guess 1
    X(2)=g1;            % second element in this vector is the guess 2
    i=0;                % No. of iterations

    % Breakpoint: f(current_x)<TOL or i>=maxiter (max iterations exceeded)
    while i<maxiter && abs(f(X(i+2)))>=TOL
    
        % If denominator is 0, divide by 0 not possible - so stop!
        if (f(X(i+2))-f(X(i+1)))==0
            error("Snap... Denominator becomes 0! Kindly try other methods :/");
        end
    
        % Follows from iteration formula
        c=X(i+2)-(f(X(i+2)))*(X(i+2)-X(i+1))/(f(X(i+2))-f(X(i+1)));
        X(i+3)=c;
        
        % Increment i
        i=i+1;

    end

    % Not encountered in this assignment and hence not taken care
    % completely
    if i==maxiter
        error("Maximum iterations exceeded! [Currently at x=%f]",c);
    end

    % Printing
    fprintf("Root found at %f",c);
    fprintf("\nNumber of steps taken: %d",i);

end

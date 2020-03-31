function c = bisection(f,a,b,TOL,maxiter)
% BISECTION Summary
%
%  INTERMEDIATE VALUE THEOREM: 
%   Given any continuous function f:[a,b]-> R (a<b w.l.g) such that
%   f(a).f(b)<0, then
%   there exists c in (a,b) such that f(c)=0
%
%  In bisection method, take c as midpoint of interval, check if f(c)==0,
%  else reduce the interval size depending on sign change (i.e. if 
%  f(a)f(c)<0 choose [a,c] as the new interval else [c,b]) and recurse 
%  so that the above properties are still satisfied.
%
%  Input:
%   - f         :   The function whose roots are to be found. 
%     [Note: f should satsify conditions required for Intermdiate Value Theorem]
%   - a,b       :   The interval [a,b] defined in Intermediate Value Theorem
%   - TOL       :   The tolerance value
%   - maxiter   :   Maximum number of iterations (This is manually given for
%     the sake of this assignment)
%
%  Output:
%   - c         :   The value c such that |f(c)| <= TOL obtained from
%   Bisection method (assuming maxiter not exceeded)
%
%  The value of c at each iteration is not required for this Assignment and
%  hence is not saved.
  


    % i is variable for number of iterations
    i=0;    
    
    % Breakpoint: |b-a|<TOL or i>=maxiter
    while abs(b-a)>=TOL && i<maxiter
        
        % c is the middle point between a and b
        c=(a+b)/2;
        
        % If the c in previous step itself is the root, we are done :)
        if f(c)==0
            break;      
        
        % Otherwise find the new interval to recurse on:
        elseif f(a)*f(c)<0
            b=c;
        else
            a=c;            
        end
        
        % Incrementing i is important!
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


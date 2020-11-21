function p = order_conv(x)
% ORDER_CONV Summary
%
% Finding order of convergence from formula in Q4 (formula also mentioned in
% SOLUTION.mlx)
%
% The vector is taken as input, the p_n 's are calculated
% according to the relation given and finally returned

    % Iteration is for length(x)-3 times only ---
    % (one less for taking difference in pair,
    % one more less for ratio within log and one more less for outside
    % ratio)
    
    for i=1:length(x)-3
        p(i)=log(abs(x(i+3)-x(i+2))/abs(x(i+2)-x(i+1)))/log(abs(x(i+2)-x(i+1))/abs(x(i+1)-x(i)));
    end
    
    % Print
    % fprintf("%f\t",p);
    % fprintf("\nOrder (approx) : %f",sum(p)/length(p));
    
end


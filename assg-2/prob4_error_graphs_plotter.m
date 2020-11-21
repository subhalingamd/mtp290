% This script is specifically to plot error graphs in Problem 4
% All values are hardcoded

% Setting up the variables
f     = @(x) sqrt(1+x.^2);                          % function
f__   = @(x) 1./((1+x.^2).^(3/2));                    % second derivative
f____ = @(x) (12*(x.^2) - 3)./((1 + x.^2).^(7/2));    % fourth derivative

n = 10;             % number of intervals   
a = 1; b = 5;       % the lower limit (a) and upper limit (b) of the integral

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% START COMPUTING THE ERRORS & PLOT A GRAPH %%

% Computing the step size
h = (b-a)/n; 

% the endpoints of the sub-intervals
intervals = [a:h:b];

a = intervals(1:end-1);  % start point of each sub-interval
b = intervals(2:end);    % end point of each sub-interval

c = (a+b)/2;             % midpoint of the sub-intervals

% Errors in Simpson Method
err_simp = -(h^4)*(b-a).*f____(c)/180;
fprintf("  Simpson Method (error values in each sub-interval) :\n")
disp(err_simp);

% For Trapezoidal Method
err_trap = -(h^2)*(b-a).*f__(c)/12;
fprintf("  Trapezoidal Method (error values in each sub-interval) :\n")
disp(err_trap)


% Plot the graph
hold on
plot(c,err_simp,'r-x');
plot(c,err_trap,'b-x');
hold off
legend("Simpson","Trapezoidal",'Location','southeast');
title("Error Graphs (for Problem 4)");
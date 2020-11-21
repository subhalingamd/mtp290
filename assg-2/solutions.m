%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOLUTION FOR Assignment 2
% 
% Submitted by: Subhalingam D (2018MT10770)
%
%   Kindly look at the individual functions their documentation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 1
fprintf("\n\n>>>>> Problem 1");
% y_ is equivalent to y', y(x0)=y0 is the initial condition, h is the step
% size and n is the number of iterations to be performed.

y_ = @(x,y) (y - y^2);  % Define y'
x0 = 0; y0 = 0.2; h = 0.1; n = 10;

% For Euler method
    fprintf("\nUsing Euler method:\n  ");
    euler(y_,x0,y0,h,n);

% For Improved Euler method
    fprintf("\nUsing Improved Euler method:\n  ");
    improved_euler(y_,x0,y0,h,n);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 2
fprintf("\n\n>>>>> Problem 2");
% y_ is equivalent to y', y(x0)=y0 is the initial condition, h is the step
% size. Find y(x) for some given x.

y_ = @(x,y) (sin(2*x) - y*tan(x));  % Define y'
x0 = 0; y0 = 1; x = 1;

% For h = 0.2
    fprintf("\nh = 0.2\n  ");
    h = 0.2;
    rk4(y_,x,x0,y0,h);

% For h = 0.1
    fprintf("\nh = 0.1\n  ");
    h = 0.1;
    rk4(y_,x,x0,y0,h);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 3
fprintf("\n\n>>>>> Problem 3");
% y_ is equivalent to y', y(x0)=y0 is the initial condition, h is the step
% size. Find y(x) for some given x in interval [a,b].

y_ = @(x,y) (x + y);  % Define y'
x0 = 0; y0 = 0; h = 0.1; a = 0; b = 2;

[Y,X] = adam(y_,x0,y0,h,a,b);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 4
fprintf("\n\n>>>>> Problem 4");

f = @(x) sqrt(1+x.^2);  % Define function
a = 1; b = 5; n = 10;

% Using Trapezoidal rule
    fprintf("\nUsing Trapezoidal rule:  ");
    ans_a = trapezoidal(f,a,b,n);
    
% Using Simpson's rule
    fprintf("\nUsing Simpson's rule:  ");
    ans_b = simpson(f,a,b,n);

% Using MATLAB's inbuilt integration methods
syms x
  f = sqrt(1+x.^2);
  ans_true = int(f,x,a,b);
clear x
fprintf("\nUsing MATLAB's inbuilt integration method:  %f\n",ans_true);

% Error Analysis
fprintf("\nError Analysis:");
    % Trapezoidal and True value
    fprintf("\n  Trapezoidal and True value:  %f",abs(ans_a-ans_true));
    
    % Simpson's and True value
    fprintf("\n  Simpson's and True value:  %f",abs(ans_b-ans_true));

    % Trapezoidal and Simpson's value (Relative Error)
    fprintf("\n  Trapezoidal and Simpson's value (Relative Error):  %f",abs(ans_a-ans_b));

% Error Graphs
fprintf("\nPlotting Error Graphs...\n");
prob4_error_graphs_plotter;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 5
fprintf("\n\n>>>>> Problem 5");
% Find the intergal of f(x) using Trapezoidal rule on [a,b]

f = @(x) x.^3 + 5*x.^2 + 1;  % Define function
a = 1; b = 5;

% with four subintervals
    n = 4;
    fprintf("\nn=4:  ");
    ans_a = trapezoidal(f,a,b,n);
    
% with eight subintervals
    n = 8;
    fprintf("\nn=8:  ");
    ans_b = trapezoidal(f,a,b,n);
    
% Using MATLAB's inbuilt integration methods
syms x
  f = x.^3 + 5*x.^2 + 1;
  ans_true = int(f,x,a,b);
clear x
fprintf("\nUsing MATLAB\'s inbuilt integration method:  %f\n",ans_true);

% Error Analysis
fprintf("\nError Analysis:");
    % n=4 and True value
    fprintf("\n  n=4 and True value:  %f",abs(ans_a-ans_true));
    
    % n=8 and True value
    fprintf("\n  n=8 and True value:  %f",abs(ans_b-ans_true));

    % n=4 and n=8 (Relative Error)
    fprintf("\n  n=4 and n=8 (Relative Error):  %f",abs(ans_a-ans_b));
    
fprintf("\nHaving eight subintervals (n=8) is more closer to correct answer");

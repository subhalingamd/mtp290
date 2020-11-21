%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SOLUTION FOR Extra Questions IN Assignment 2
% 
% Submitted by: Subhalingam D (2018MT10770)
%
%   Kindly look at the individual functions their documentation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 1
fprintf("\n\n>>>>> Problem 1");
% Compare the Secant root finding method with Newton’s root finding method 
% using a code. (Mention at least two advantages/disadvantages. Use
% suitable functions.)

% y_ is equivalent to y', y(x0)=y0 is the initial condition, h is the step
% size and n is the number of iterations to be performed.

% f = @(x) 230*x^4+18*x^3+9*x^2-221*x-9;
% f_= @(x) 920*x^3+54*x^2+18*x-221;

fprintf("\n* The order of convergence is 2 (quadratic) for Newton method while it is 1.62 (super linear) for Secant method");
f = @(x) exp(-x) - 3*log(x);
f_= @(x) -exp(-x) - 3./x;

fprintf("\nf = ")
disp(f);

fprintf("Newton Method:\n");
[c,x] = newton(f,f_,1,1e-6,1000);
order = order_conv(x);
fprintf("\nOrder of convergence: %f\n",order(end));
%disp(order);

fprintf("\nSecant Method:\n");
[c,x] = secant(f,1,2,1e-6,1000);
order = order_conv(x);
fprintf("\nOrder of convergence: %f\n",order(end));
%disp(order);




fprintf("\n\n* Newton method breaks down if the derivative is (close to) 0.");
f = @(x) cos(x);
f_= @(x) -sin(x);

fprintf("\nf = ")
disp(f);

fprintf("Newton Method:\n");
try
    newton(f,f_,0,1e-6,1000);
catch e
    disp(e.message);
end

fprintf("\nSecant Method:\n");
secant(f,0,pi,1e-6,1000);


fprintf("\n\n* The methods need not converge.");
f = @(x) x.^(1/3);
f_= @(x) (x.^(-2/3))/3;

fprintf("\nf = ")
disp(f);
fprintf("e.g. For Newton method, x(n+1) = x(n) - (x(n)^(1/3) / (1/3)*(x(n)^(-2/3))) = -2*x(n) => x(n) is diverging. \n");

fprintf("\nNewton Method:\n");
try
    newton(f,f_,1,1e-3,1000);
catch e
    disp(e.message);
end

fprintf("\nSecant Method:\n");
try
    secant(f,-1,1,1e-3,1000)
catch e
    disp(e.message);
end


fprintf("\n\n* Newton method requires only ONE initial value while Secant method requires TWO initial values.");

fprintf("\n\n* Newton method also requires DERIVATIVE of the function while Secant method uses only FUNCTION values. So Newton method may not be helpful if the function is not differentiable or if the function is complex and finding its derivative is difficult.");

fprintf("\n\n* If initial values are too far from the root, the methods can fail to converge.");



fprintf("\n\n");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Problem 2
fprintf("\n\n>>>>> Problem 2");
% Find Doolittle's method of given matrix

A = [ 1 ,  2 , -1 ;
      2 ,  2 ,  3 ;
     -1 , -3 ,  0  ];

[L,U] = doolittle(A);
# disp(L*U == A);

fprintf("\nL =\n");disp(L);
fprintf("\nU =\n");disp(U);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [L,U] = lu_d(A,B)
    %GAUSS Summary of this function goes here
    %   Detailed explanation goes here
    %only 3x3
   L=eye(3);
   U=zeros(3,3);
   
   for i=1:3
       U(1,i)=A(1,i);
   end
   
   L(2,1)=A(2,1)/U(1,1);   
   L(3,1)=A(3,1)/U(1,1);
    
    
    U(2,2)=A(2,2)-L(2,1)*U(1,2);
    U(2,3)=A(2,3)-L(2,1)*U(1,3);
    
    L(3,2)=(A(3,2)-L(3,1)*U(1,2))/U(2,2);
    
    U(3,3)=A(3,3)-L(3,1)*U(1,3)-L(3,2)*U(2,3);
  
end


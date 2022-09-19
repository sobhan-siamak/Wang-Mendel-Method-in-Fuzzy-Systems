function [ yhatdata ] =ZCOA2partB( num1,num2,mu1data,mu2data,RBDataFinal,stepydata,Fcentydata )

%w1 w2 w3 
% W(i)=muidata(i)
%a1-a3   a1-a3=stepy
%z1%z3   z1-z3=Fcenty(i)
%zcoa=(w1a1z1+w2a2z2+...)/(w1a1+w2a2+...)
%yhatdata=zcoadata

a1=stepydata;
a2=stepydata;

w1=mu1data;
w2=mu2data;

y1=RBDataFinal(num1);
y2=RBDataFinal(num2);

z1=Fcentydata(y1);
z2=Fcentydata(y2);



zcoadata=((w1*a1*z1)+(w2*a2*z2))/((w1*a1)+(w2*a2));
yhatdata=zcoadata;


    


end


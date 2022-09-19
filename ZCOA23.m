function [ yhat ] = ZCOA23( num11,num12,num21,num22,num23,mutx11,mutx12,mutx21,mutx22,mutx23,RuleBaseFinal,stepy,Fcenty )

%w1 w2 w3 w4 w5 w6
% W(i)=min(mux1,mux2)
%a1-a6   a1-a6=stepy
%z1%z6   z1-z6=Fcenty(i)
%zcoa=(w1a1z1+w2a2z2+...)/(w1a1+w2a2+...)
%yhat=zcoa

a1=stepy;
a2=stepy;
a3=stepy;
a4=stepy;
a5=stepy;
a6=stepy;

w1=min(mutx11,mutx21);
w2=min(mutx11,mutx22);
w3=min(mutx11,mutx23);
w4=min(mutx12,mutx21);
w5=min(mutx12,mutx22);
w6=min(mutx12,mutx23);


y1=RuleBaseFinal(num11,num21);
y2=RuleBaseFinal(num11,num22);
y3=RuleBaseFinal(num11,num23);
y4=RuleBaseFinal(num12,num21);
y5=RuleBaseFinal(num12,num22);
y6=RuleBaseFinal(num12,num23);


z1=Fcenty(y1);
z2=Fcenty(y2);
z3=Fcenty(y3);
z4=Fcenty(y4);
z5=Fcenty(y5);
z6=Fcenty(y6);




zcoa=((w1*a1*z1)+(w2*a2*z2)+(w3*a3*z3)+(w4*a4*z4)+(w5*a5*z5)+(w6*a6*z6))/((w1*a1)+(w2*a2)+(w3*a3)+(w4*a4)+(w5*a5)+(w6*a6));
yhat=zcoa;


end


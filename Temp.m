
% %indx=0;
% f=[];
% for i=1:41
%     for j=1:41
% %    a=     indx=indx+1;
%      f(i,j)=i+j;
%     end
% end
% % dip(indx)
% f=[];
%%%%%%%%%%%%%% @copy sobhan siamak 9731582


%%
clc;
clear ;
close all;

%X1=linspace(-5,5,41);
%X2=linspace(-5,5,41);
X1=[-5:0.25:5];
X2=[-5:0.25:5];


n=size(X1,2);
m=size(X2,2);
fuzzysetnumbers=7;

xmin=-5;
xmax=5;
ymin=0;
ymax=50;
pointx=41;
pointy=1681;
RBpoint=1681;
stepx=(xmax-xmin)/(fuzzysetnumbers-1);
stpx=0.25;
% stepx=1.666666;%because matlab calculate to 4 digit float

stepy=(ymax-ymin)/(fuzzysetnumbers-1);
% stepy=8.33333;%because matlab calculate to 4 digit float

Y=zeros(n,m);
for i=1:n
    for j=1:m
        Y(i,j)=X1(i).^2+X2(j).^2;
    end
end
surf(X1,X2,Y);


Fcentx=[xmin:stepx:xmax];
Fcenty=[ymin:stepy:ymax];

%RuleBase=cell(1,RBpoint);%RBpoint is the number of Rules or 1681 
RuleBase=zeros(RBpoint,4);%RBpoint is the number of Rules or 1681 
% attension that 4th Dimension is Firing Degree
index=0;% is the index of RuleBase Matrix
for x1=xmin:stpx:xmax
     for x2=xmin:stpx:xmax
        index=index+1;
        %%%%%%%Fuzzysets on X1
        if(x1==xmin)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            if(mu1>mu2)
                mux1=mu1;
                RuleBase(index,1)=1;
            end
            if(mu2>mu1)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
        end%%%%%%%%%%%%%
        if(x1>xmin && x1<xmin+stepx)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            if(mu1>mu2)
                mux1=mu1;
                RuleBase(index,1)=1;
            end
            if(mu2>mu1)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
        end
        if(x1==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x1);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mx=mu1;
            if(mu2>mx)
                mx=mu2;
            end
            if(mu3>mx)
                mx=mu3;
            end
            if(mx==mu1)
                mux1=mu1;
                RuleBase(index,1)=1;
            end
            if(mx==mu2)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
            if(mx==mu3)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            
            
        end
        if(x1>xmin+stepx && x1<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            if(mu2>mu3)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            if(mu3>mu2)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            
        end
        if(x1==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x1);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mx=mu2;
            if(mu3>mx)
                mx=mu3;
            end
            if(mu4>mx)
                mx=mu4;
            end
            if(mx==mu2)
                mux1=mu2;
                RuleBase(index,1)=2;
            end
            if(mx==mu3)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            if(mx==mu4)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
            
        end  %%%%%%%%%%
        if(x1>xmin+2*stepx && x1<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            if(mu3>mu4)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            if(mu4>mu3)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
        end %%%%%%%%%%
        if(x1==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x1);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mx=mu3;
            if(mu4>mx)
                mx=mu4;
            end
            if(mu5>mx)
                mx=mu5;
            end
            if(mx==mu3)
                mux1=mu3;
                RuleBase(index,1)=3;
            end
            if(mx==mu4)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
            if(mx==mu5)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
        end  %%%%%%%%%%%%
        if(x1>xmin+3*stepx && x1<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            if(mu4>mu5)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
            if(mu5>mu4)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(x1==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x1);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mx=mu4;
            if(mu5>mx)
                mx=mu5;
            end
            if(mu6>mx)
                mx=mu6;
            end
            if(mx==mu4)
                mux1=mu4;
                RuleBase(index,1)=4;
            end
            if(mx==mu5)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
            if(mx==mu6)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
        end  %%%%%%%%%%%%%%%%
        if(x1>xmin+4*stepx && x1<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            if(mu5>mu6)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
            if(mu6>mu5)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
            
        end  %%%%%%%%%%%%%%%%%%
        if(x1==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x1);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            mx=mu5;
            if(mu6>mx)
                mx=mu6;
            end
            if(mu7>mx)
                mx=mu7;
            end
            if(mx==mu5)
                mux1=mu5;
                RuleBase(index,1)=5;
            end
            if(mx==mu6)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
            if(mx==mu7)
                mux1=mu7;
                RuleBase(index,1)=7;
            end
        end%%%%%%%%%%%%%%%%%
        if(x1>xmin+5*stepx && x1<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            if(mu6>mu7)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
            if(mu7>mu6)
                mux1=mu7;
                RuleBase(index,1)=7;
            end
        end  %%%%%%%%%%%%
        if(x1==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x1);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x1);
            if(mu6>mu7)
                mux1=mu6;
                RuleBase(index,1)=6;
            end
            if(mu7>mu6)
                mux1=mu7;
                RuleBase(index,1)=7;
            end
        end
        %%%%%%Fuzzysets on X2
        if(x2==xmin)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            if(mu1>mu2)
                mux2=mu1;
                RuleBase(index,2)=1;
            end
            if(mu2>mu1)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
        end%%%%%%%%%%%%%%%
        if(x2>xmin && x2<xmin+stepx)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            if(mu1>mu2)
                mux2=mu1;
                RuleBase(index,2)=1;
            end
            if(mu2>mu1)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
        end%%%%%%%%%%%%%%%
        if(x2==xmin+stepx)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1=TriFuzzySetX(Fcentx(1)-stepx,Fcentx(1),Fcentx(1)+stepx,x2);
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mx=mu1;
            if(mu2>mx)
                mx=mu2;
            end
            if(mu3>mx)
                mx=mu3;
            end
            if(mx==mu1)
                mux2=mu1;
                RuleBase(index,2)=1;
            end
            if(mx==mu2)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
            if(mx==mu3)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
        end%%%%%%%%%%%%%%%%%%%%%
        if(x2>xmin+stepx && x2<xmin+2*stepx)%Fuzzyset#2 and Fuzzyset#3
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            if(mu2>mu3)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            if(mu3>mu2)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            
            
        end%%%%%%%%%%%%%%%%%%
        if(x2==xmin+2*stepx)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu2=TriFuzzySetX(Fcentx(2)-stepx,Fcentx(2),Fcentx(2)+stepx,x2);
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mx=mu2;
            if(mu3>mx)
                mx=mu3;
            end
            if(mu4>mx)
                mx=mu4;
            end
            if(mx==mu2)
                mux2=mu2;
                RuleBase(index,2)=2;
            end
            if(mx==mu3)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            if(mx==mu4)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
            
        end %%%%%%%%%%%%%%%%
        if(x2>xmin+2*stepx && x2<xmin+3*stepx)%Fuzzyset#3 and Fuzzyset#4
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            if(mu3>mu4)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            if(mu4>mu3)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
        end%%%%%%%%%%%%%%
        if(x2==xmin+3*stepx)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu3=TriFuzzySetX(Fcentx(3)-stepx,Fcentx(3),Fcentx(3)+stepx,x2);
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mx=mu3;
            if(mu4>mx)
                mx=mu4;
            end
            if(mu5>mx)
                mx=mu5;
            end
            if(mx==mu3)
                mux2=mu3;
                RuleBase(index,2)=3;
            end
            if(mx==mu4)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
            if(mx==mu5)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
        end %%%%%%%%%%%%%%%%%%%%%
        if(x2>xmin+3*stepx && x2<xmin+4*stepx)%Fuzzyset#4 and Fuzzyset#5
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            if(mu4>mu5)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
            if(mu5>mu4)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
        end %%%%%%%%%%%%%%
        if(x2==xmin+4*stepx)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu4=TriFuzzySetX(Fcentx(4)-stepx,Fcentx(4),Fcentx(4)+stepx,x2);
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mx=mu4;
            if(mu5>mx)
                mx=mu5;
            end
            if(mu6>mx)
                mx=mu6;
            end
            if(mx==mu4)
                mux2=mu4;
                RuleBase(index,2)=4;
            end
            if(mx==mu5)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
            if(mx==mu6)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
        end%%%%%%%%%%%%%%%%%%%%%
        if(x2>xmin+4*stepx && x2<xmin+5*stepx)%Fuzzyset#5 and Fuzzyset#6
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            if(mu5>mu6)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
            if(mu6>mu5)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
        end%%%%%%%%%%%%%%%%%%%%%%%%
        if(x2==xmin+5*stepx)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu5=TriFuzzySetX(Fcentx(5)-stepx,Fcentx(5),Fcentx(5)+stepx,x2);
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            mx=mu5;
            if(mu6>mx)
                mx=mu6;
            end
            if(mu7>mx)
                mx=mu7;
            end
            if(mx==mu5)
                mux2=mu5;
                RuleBase(index,2)=5;
            end
            if(mx==mu6)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
            if(mx==mu7)
                mux2=mu7;
                RuleBase(index,2)=7;
            end
        end%%%%%%%%%%%%%%%%%%
        if(x2>xmin+5*stepx && x2<xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            if(mu6>mu7)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
            if(mu7>mu6)
                mux2=mu7;
                RuleBase(index,2)=7;
            end
        end%%%%%%%%%%%%%%%%%%%%%%
        if(x2==xmin+6*stepx)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetX(Fcentx(6)-stepx,Fcentx(6),Fcentx(6)+stepx,x2);
            mu7=TriFuzzySetX(Fcentx(7)-stepx,Fcentx(7),Fcentx(7)+stepx,x2);
            if(mu6>mu7)
                mux2=mu6;
                RuleBase(index,2)=6;
            end
            if(mu7>mu6)
                mux2=mu7;
                RuleBase(index,2)=7;
            end
        end%%%%%%%%%%%%%%%
        
          y=x1^2+x2^2; 
        %%%%%%%%Fuzzysets on Y
        if(y==ymin)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetY(Fcenty(1)-stepy,Fcenty(1),Fcenty(1)+stepy,y);
            mu2=TriFuzzySetY(Fcentx(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            if(mu1>mu2)
                muy=mu1;
                RuleBase(index,3)=1;
            end
            if(mu2>mu1)
                muy=mu2;
                RuleBase(index,3)=2;
            end
        end%%%%%%%%%%%%%%%%
        if(y>xmin && y<xmin+stepy)%Fuzzyset#1 and Fuzzyset#2
            mu1=TriFuzzySetY(Fcenty(1)-stepy,Fcenty(1),Fcenty(1)+stepy,y);
            mu2=TriFuzzySetY(Fcenty(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            if(mu1>mu2)
                muy=mu1;
                RuleBase(index,3)=1;
            end
            if(mu2>mu1)
                muy=mu2;
                RuleBase(index,3)=2;
            end
        end%%%%%%%%%%%%%%%%
        if(y==ymin+stepy)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1=TriFuzzySetY(Fcenty(1)-stepy,Fcenty(1),Fcenty(1)+stepy,y);
            mu2=TriFuzzySetY(Fcentx(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            mx=mu1;
            if(mu2>mx)
                mx=mu2;
            end
            if(mu3>mx)
                mx=mu3;
            end
            if(mx==mu1)
                muy=mu1;
                RuleBase(index,3)=1;
            end
            if(mx==mu2)
                muy=mu2;
                RuleBase(index,3)=2;
            end
            if(mx==mu3)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            
        end%%%%%%%%%%%%%%%%%%%
        if(y>ymin+stepy && y<ymin+2*stepy)%Fuzzyset#2 and Fuzzyset#3
            mu2=TriFuzzySetY(Fcenty(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            if(mu2>mu3)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            if(mu3>mu2)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            
        end%%%%%%%%%%%%%%%%%
        if(y==ymin+2*stepy)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu2=TriFuzzySetY(Fcenty(2)-stepy,Fcenty(2),Fcenty(2)+stepy,y);
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            mx=mu2;
            if(mu3>mx)
                mx=mu3;
            end
            if(mu4>mx)
                mx=mu4;
            end
            if(mx==mu2)
                muy=mu2;
                RuleBase(index,3)=2;
            end
            if(mx==mu3)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            if(mx==mu4)
                muy=mu4;
                RuleBase(index,3)=4;
            end
        end%%%%%%%%%%%%%%%%%%
        if(y>ymin+2*stepy && y<ymin+3*stepy)%Fuzzyset#3 and Fuzzyset#4
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            if(mu3>mu4)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            if(mu4>mu3)
                muy=mu4;
                RuleBase(index,3)=4;
            end
        end%%%%%%%%%%%%%%%%%%%
        if(y==ymin+3*stepy)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu3=TriFuzzySetY(Fcenty(3)-stepy,Fcenty(3),Fcenty(3)+stepy,y);
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            mx=mu3;
            if(mu4>mx)
                mx=mu4;
            end
            if(mu5>mx)
                mx=mu5;
            end
            if(mx==mu3)
                muy=mu3;
                RuleBase(index,3)=3;
            end
            if(mx==mu4)
                muy=mu4;
                RuleBase(index,3)=4;
            end
            if(mx==mu5)
                muy=mu5;
                RuleBase(index,3)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(y>ymin+3*stepy && y<ymin+4*stepy)%Fuzzyset#4 and Fuzzyset#5
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            if(mu4>mu5)
                muy=mu4;
                RuleBase(index,3)=4;
            end
            if(mu5>mu4)
                muy=mu5;
                RuleBase(index,3)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(y==ymin+4*stepy)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu4=TriFuzzySetY(Fcenty(4)-stepy,Fcenty(4),Fcenty(4)+stepy,y);
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            mx=mu4;
            if(mu5>mx)
                mx=mu5;
            end
            if(mu6>mx)
                mx=mu6;
            end
            if(mx==mu4)
                muy=mu4;
                RuleBase(index,3)=4;
            end
            if(mx==mu5)
                muy=mu5;
                RuleBase(index,3)=5;
            end
            if(mx==mu6)
                muy=mu6;
                RuleBase(index,3)=6;
            end
        end%%%%%%%%%%%%%%%
        if(y>ymin+4*stepy && y<ymin+5*stepy)%Fuzzyset#5 and Fuzzyset#6
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            mu6=TriFuzzySetY(Fcentx(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            if(mu5>mu6)
                muy=mu5;
                RuleBase(index,3)=5;
            end
            if(mu6>mu5)
                muy=mu6;
                RuleBase(index,3)=6;
            end
            
        end%%%%%%%%%%%%%%%
        if(y==ymin+5*stepy)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu5=TriFuzzySetY(Fcenty(5)-stepy,Fcenty(5),Fcenty(5)+stepy,y);
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            mu7=TriFuzzySetY(Fcenty(7)-stepy,Fcenty(7),Fcenty(7)+stepy,y);
            mx=mu5;
            if(mu6>mx)
                mx=mu6;
            end
            if(mu7>mx)
                mx=mu7;
            end
            if(mx==mu5)
                muy=mu5;
                RuleBase(index,3)=5;
            end
            if(mx==mu6)
                muy=mu6;
                RuleBase(index,3)=6;
            end
            if(mx==mu7)
                muy=mu7;
                RuleBase(index,3)=7;
            end
        end%%%%%%%%%%%%%%%
        if(y>ymin+5*stepy && y<ymin+6*stepy)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            mu7=TriFuzzySetY(Fcenty(7)-stepy,Fcenty(7),Fcenty(7)+stepy,y);
            if(mu6>mu7)
                muy=mu6;
                RuleBase(index,3)=6;
            end
            if(mu7>mu6)
                muy=mu7;
                RuleBase(index,3)=7;
            end
        end%%%%%%%%%%%%%%
        if(y==ymin+6*stepy)%Fuzzyset#6 and Fuzzyset#7
            mu6=TriFuzzySetY(Fcenty(6)-stepy,Fcenty(6),Fcenty(6)+stepy,y);
            mu7=TriFuzzySetY(Fcenty(7)-stepy,Fcenty(7),Fcenty(7)+stepy,y);
            if(mu6>mu7)
                muy=mu6;
                RuleBase(index,3)=6;
            end
            if(mu7>mu6)
                muy=mu7;
                RuleBase(index,3)=7;
            end
        end%%%%%%%%%%%%%
         
  %%%%location of Firing degree=mux1*mux2*muy=index4 of RuleBase Matrix
        RuleBase(index,4)=(mux1*mux2*muy);
      
        %index=index+1;
    end
   % index=index+1;
   
end

%% Select one of the same Rule Bases
% RuleBaseTemp1=[];
% RuleBaseTemp1=unique(RuleBase,'rows');
% RBTemp1=[];%for same Rules
% RBTemp2=[];%for different Rules
% m=size(RuleBase,1);
% indx=1;
% 
% for i=1:m
%     a=RuleBase(i,1:4);
%     mx=a;
%     for j=1:m
%         if(i~=j)
%             if(((RuleBase(j,1:3)-a(i,1:3))==[0 0 0])&& (RuleBase(j,4)>a(i,4)))
%                 mx=RuleBase(j,1:4);
%             end
%         end
%     end
%     if(mx~=a)
%         RuleBaseTemp1(indx,1:4);
%         indx=indx+1;
%     end
% end
% 
% 
% 
% 
% 
% 
% 
% % index1=1;
% % index2=1;
% % index3=1;
% % for i=1:m
% %     RBTemp1(index1,1:4)=RuleBase(i,1:4);
% %     for j=1:m
% %         if(i~=j)
% %             if(isequal(RBTemp1(i,1:3),RuleBase(j,1:3)))
% %                 index1=index1+1;
% %                 RBTemp1(index1,1:4)=RuleBase(j,1:4);
% %             end
% %         end
% %     end
% %     RBTemp1=sort(RBTemp1,'descend');
% %     RuleBaseTemp(1,1:4)=RBTemp1(1,1:4);
% %     RBTemp1=[];
% % end
% 
% 
% 
% 
% 
% % RuleBase2=RuleBase;
% % indexmx=1;
% % for i=1:m
% %     maxrule=RuleBase2(i,1:3);
% %     maxdegree=RuleBase2(i,4);
% %     RuleBaseTemp(indexmx,1:3)=RuleBase2(i,1:3);
% %     RuleBaseTemp(indexmx,4)=RuleBase2(i,4);
% %     for j=1:m
% %         if(i~=j)
% %            if(isequal(maxrule,RuleBase2(j,1:3)))
% %                 if(RuleBase2(j,4)>maxdegree)
% %                     maxrule=RuleBase2(j,1:3);
% %                     maxdegree=RuleBase2(j,4);
% %                 end
% %            end
% %             
% %         end 
% %         
% %     end
% %     if(isequal(maxdegree,RuleBaseTemp(indexmx,4))==0)
% %        % if((isequal(RuleBaseTemp(:,1:3),maxrule)==0) && (isequal(RuleBaseTemp(:,4),maxdegree))==0)
% %            RuleBaseTemp(indexmx,1:3)=maxrule;
% %            RuleBaseTemp(indexmx,4)=maxdegree;
% %            indexmx=indexmx+1;
% %         %end
% %     end
% % %     for k=1:m
% % %         if(isequal(RuleBaseTemp(indexmx,1:3),maxrule))
% % %             RuleBase2(k,:)=[];
% % %         end
% % %         m=size(RuleBase2,1);
% % %     end
% % end
% % %RuleBaseTemp=unique(RuleBaseTemp,'rows','stable');
% % % RBTemp=zeros(m,4);
% % % indx=1;
% % % RBTemp(indx,1:4)=RuleBaseTemp(1,1:4);
% % % for i=2:m
% % %     
% % %     if(isequal(RBTemp(:,1:4),RuleBaseTemp(i,1:4))==0)
% % % %         indx=indx+1;
% % %         RBTemp(i,1:4)=RuleBaseTemp(i,1:4);
% % %     end
% % % end 
% % 



%% Delete Conflict Rule Bases and Select one of them

%% Select one of the same Rule Bases
% RuleBaseTemp=[];
% m=size(RuleBase,1);
% RuleBase2=unique(RuleBase,'rows');
% m=size(RuleBase2,1);
% indexmx=1;
% for i=1:m
%     maxrule=RuleBase2(i,1:3);
%     maxdegree=RuleBase2(i,4);
%     RuleBaseTemp(indexmx,1:3)=RuleBase2(i,1:3);
%     RuleBaseTemp(indexmx,4)=RuleBase2(i,4);
%     for j=1:m
%         if(i~=j)
%            if(isequal(maxrule,RuleBase2(j,1:3)))
%                 if(RuleBase2(j,4)>maxdegree)
%                     maxrule=RuleBase2(j,1:3);
%                     maxdegree=RuleBase2(j,4);
%                 end
%            end
%             
%         end 
%         
%     end
%     if(isequal(maxdegree,RuleBaseTemp(indexmx,4))==0)
%        % if((isequal(RuleBaseTemp(:,1:3),maxrule)==0) && (isequal(RuleBaseTemp(:,4),maxdegree))==0)
%            RuleBaseTemp(indexmx,1:3)=maxrule;
%            RuleBaseTemp(indexmx,4)=maxdegree;
%            indexmx=indexmx+1;
%         %end
%     end
% 
% end

%% Delete Conflict and Same Rule Bases and Select one of them

RuleBaseFinal=zeros(7,7);
FDegree=zeros(7,7);
[m2,n2]=size(RuleBaseFinal);
m1=size(RuleBase,1);
for i=1:m1
   for j=1:m2
       for k=1:n2
           if((RuleBase(i,1)==j)&&(RuleBase(i,2)==k)&&FDegree(j,k)<RuleBase(i,4))
               RuleBaseFinal(j,k)=RuleBase(i,3);
               FDegree(j,k)=RuleBase(i,4);
           end
           
       end
   end
    
end







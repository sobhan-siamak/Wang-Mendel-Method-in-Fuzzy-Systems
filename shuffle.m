function [ datash] = shuffle( data )



[m,n]=size(data);
datash=zeros(m,n);%%%Data Shuffle


% point1=randi([1,round(m/5)]);
% point2=randi([round(m/5),round((2*m)/5)]);
% point3=randi([round((2*m/5)),round((3*m)/5)]);
% point4=randi([round((3*m/5)),round((4*m)/5)]);
% point5=randi([round((4*m/5)),m]);
point1=round(m/5);%%%60
point2=round((2*m)/5);%%%120
point3=round((3*m)/5);%%%180
point4=round((4*m)/5);%%%240
% point5=m;
% point1=60;
% point2=120;
% point3=180;
% point4=240;

num=randi([1,7]);
  if(num==1)
   datash(1:point1,:)=data(point4+1:m,:);
   datash(point1+1:point2,:)=data(1:point1,:);
   datash(point2+1:point3,:)=data(point3+1:point4,:);
   datash(point3+1:point4,:)=data(point1+1:point2,:);
   datash(point4+1:m,:)=data(point2+1:point3,:);
  end
  if(num==2)
   datash(1:point1,:)=data(point3+1:point4,:);
   datash(point1+1:point2,:)=data(point2+1:point3,:);
   datash(point2+1:point3,:)=data(point1+1:point2,:);
   datash(point3+1:point4,:)=data(point4+1:m,:);
   datash(point4+1:m,:)=data(1:point1,:);
  end
  if(num==3)
   datash(1:point1,:)=data(point2+1:point3,:);
   datash(point1+1:point2,:)=data(point4+1:m,:);
   datash(point2+1:point3,:)=data(point1+1:point2,:);
   datash(point3+1:point4,:)=data(1:point1,:);
   datash(point4+1:m,:)=data(point3+1:point4,:);
  end
  if(num==4)
   datash(1:point1,:)=data(point1+1:point2,:);
   datash(point1+1:point2,:)=data(1:point1,:);
   datash(point2+1:point3,:)=data(point2+1:point3,:);
   datash(point3+1:point4,:)=data(point4+1:m,:);
   datash(point4+1:m,:)=data(point3+1:point4,:);
  end
  if(num==5)
   datash(1:point1,:)=data(point4+1:m,:);
   datash(point1+1:point2,:)=data(point3+1:point4,:);
   datash(point2+1:point3,:)=data(1:point1,:);
   datash(point3+1:point4,:)=data(point2+1:point3,:);
   datash(point4+1:m,:)=data(point1+1:point2,:);
  end
  if(num==6)
   datash(1:point1,:)=data(point3+1:point4,:);
   datash(point1+1:point2,:)=data(point1+1:point2,:);
   datash(point2+1:point3,:)=data(point4+1:m,:);
   datash(point3+1:point4,:)=data(1:point1,:);
   datash(point4+1:m,:)=data(point2+1:point3,:);
  end
  if(num==7)
   datash(1:point1,:)=data(point2+1:point3,:);
   datash(point1+1:point2,:)=data(point4+1:m,:);
   datash(point2+1:point3,:)=data(point3+1:point4,:);
   datash(point3+1:point4,:)=data(point1+1:point2,:);
   datash(point4+1:m,:)=data(1:point1,:);
  end




  num2=randi([1,7]);
  point=round(m/2);
  if(num2>=4)
     temp= datash(1:point,:);
     datash(1:point,:)=datash(point+1:m,:);
     datash(point+1:m,:)=temp;
  end
 
%  for i=1:2:m-2
%           temp=datash(i,:);
%           datash(i,:)=datash(i+1,:);
%           datash(i+1,:)=temp;          
%  end
%  
%  for i=1:5:m-5
%           temp=datash(i,:);
%           datash(i,:)=datash(i+1,:);
%           datash(i+1,:)=temp;          
%  end
% 


end


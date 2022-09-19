


data=load('data.txt');
x=data(:,1);
y=data(:,2);
% x=sort(x);
% y=sort(y);
datash=shuffle(data);
x1=datash(:,1);
y1=datash(:,2);
% x1=sort(x1);
% y1=sort(y1);
 figure(1)
 scatter(x,y)
 figure(2)
 scatter(x1,y1)




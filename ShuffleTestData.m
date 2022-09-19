function [ testdatash] = ShuffleTestData( TestData )
     

[m,n]=size(TestData);
testdatash=zeros(m,n);%%%Test Data Shuffle


point1=round(m/3);
point2=round(2*m/3);

% for k=1:20
num=randi([1,3]);
  if(num==1)
      testdatash(1:point1,:)=TestData(point2+1:m,:);
      testdatash(point1+1:point2,:)=TestData(1:point1,:);
      testdatash(point2+1:m,:)=TestData(point1+1:point2,:);
  end
  if(num==2)
      testdatash(1:point1,:)=TestData(point1+1:point2,:);
      testdatash(point1+1:point2,:)=TestData(point2+1:m,:);
      testdatash(point2+1:m,:)=TestData(1:point1,:);
  end
  if(num==3)
      testdatash(1:point1,:)=TestData(1:point1,:);
      testdatash(point1+1:point2,:)=TestData(point2+1:m,:);
      testdatash(point2+1:m,:)=TestData(point1+1:point2,:);
  end
  
  
  
  
  num2=randi([1,7]);
  point=round(m/2);
  if(num2>=4)
     temp= testdatash(1:point,:);
     testdatash(1:point,:)=testdatash(point+1:m,:);
     testdatash(point+1:m,:)=temp;
  end

  
  for i=1:2:m-2
          temp=testdatash(i,:);
          testdatash(i,:)=testdatash(i+1,:);
          testdatash(i+1,:)=temp;          
 end
 
 for i=1:5:m-5
          temp=testdatash(i,:);
          testdatash(i,:)=testdatash(i+1,:);
          testdatash(i+1,:)=temp;          
 end


% end
     

end


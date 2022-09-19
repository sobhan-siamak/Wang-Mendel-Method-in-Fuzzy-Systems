

  data=load('data.txt');
  data=shuffle(data);
  
  xdata=data(:,1);
  ydata=data(:,2);
  
  scatter(xdata,ydata,'filled');
  xlabel('Original First X');
  ylabel('Original First y');
  
  [md,nd]=size(data);
  TrainData=data(1:(0.8*md),:);
  TestData=data((0.8*md)+1:md,:);
  [mt,nt]=size(TrainData);
  
  
  fuzzysetnumbers=7;
  
%    TrainData=sortrows(TrainData);
  

  Xtrain1=TrainData(:,1);
  Ytrain1=TrainData(:,2);
  
%   Xtest1=TestData(:,1);
%   Ytest1=TestData(:,2);
  
  
  
  xmindata=min(xdata);
  xmaxdata=max(xdata);
  
  
  
  ymindata=min(ydata);
  ymaxdata=max(ydata);
  
  
  
  stepxdata=(xmaxdata-xmindata)/(fuzzysetnumbers-1);
  stepydata=(ymaxdata-ymindata)/(fuzzysetnumbers-1);
  %stepydata=7.33333;
  
  Fcentxdata=[xmindata:stepxdata:xmaxdata];
  Fcentydata=[ymindata:stepydata:ymaxdata];
%   stpxdata=(xmaxdata-xmindata)/300;
  RBPointdata=mt;
  RuleBaseData=zeros(mt,3);%3th dimention is Firing Degree
  indexdata=0;% is the index of RuleBaseData Matrix
  for w=1:md
      %%%%%%%Fuzzysets on Xdata
      indexdata=indexdata+1;
%        x=Xtrain1(w,1);
       x=xdata(w,1);
      if(x==xmindata)%Fuzzyset#1 and Fuzzyset#2
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            if(mu1data>mu2data)
                muxdata=mu1data;
                RuleBaseData(indexdata,1)=1;
            end
            if(mu2data>mu1data)
                muxdata=mu2data;
                RuleBaseData(index,1)=2;
            end
       end%%%%%%%%%%%%%
       if(x>xmindata && x<xmindata+stepxdata)%Fuzzyset#1 and Fuzzyset#2
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            if(mu1data>mu2data)
                muxdata=mu1data;
                RuleBaseData(indexdata,1)=1;
            end
            if(mu2data>mu1data)
                muxdata=mu2data;
                RuleBaseData(indexdata,1)=2;
            end
       end%%%%%%%%%%%%%%%
       if(x==xmindata+stepxdata)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            mu3data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            mxdata=mu1data;
            if(mu2data>mxdata)
                mxdata=mu2data;
            end
            if(mu3data>mxdata)
                mxdata=mu3data;
            end
            if(mxdata==mu1data)
                muxdata=mu1data;
                RuleBaseData(indexdata,1)=1;
            end
            if(mxdata==mu2data)
                muxdata=mu2data;
                RuleBaseData(indexdata,1)=2;
            end
            if(mxdata==mu3data)
                muxdata=mu3data;
                RuleBaseData(indexdata,1)=3;
            end
                        
       end%%%%%%%%%%%%%%%%%%
       if(x>xmindata+stepxdata && x<xmindata+2*stepxdata)%Fuzzyset#2 and Fuzzyset#3
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            mu3data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            if(mu2data>mu3data)
                muxdata=mu2data;
                RuleBaseData(indexdata,1)=2;
            end
            if(mu3data>mu2data)
                muxdata=mu3data;
                RuleBaseData(indexdata,1)=3;
            end
            
        end
        if(x==xmindata+2*stepxdata)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            mu3data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            mu4data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            mxdata=mu2data;
            if(mu3data>mxdata)
                mxdata=mu3data;
            end
            if(mu4data>mxdata)
                mxdata=mu4data;
            end
            if(mxdata==mu2data)
                mux1data=mu2data;
                RuleBaseData(indexdata,1)=2;
            end
            if(mxdata==mu3data)
                muxdata=mu3data;
                RuleBasedata(indexdata,1)=3;
            end
            if(mxdata==mu4data)
                muxdata=mu4data;
                RuleBaseData(indexdata,1)=4;
            end
            
        end%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if(x>xmindata+2*stepxdata && x<xmindata+3*stepxdata)%Fuzzyset#3 and Fuzzyset#4
            mu3data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            mu4data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            if(mu3data>mu4data)
                muxdata=mu3data;
                RuleBaseData(indexdata,1)=3;
            end
            if(mu4data>mu3data)
                muxdata=mu4data;
                RuleBaseData(indexdata,1)=4;
            end
        end %%%%%%%%%%%%%%
        if(x==xmindata+3*stepxdata)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu3data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            mu4data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            mu5data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            mxdata=mu3data;
            if(mu4data>mxdata)
                mxdata=mu4data;
            end
            if(mu5data>mxdata)
                mxdata=mu5data;
            end
            if(mxdata==mu3data)
                muxdata=mu3data;
                RuleBaseData(indexdata,1)=3;
            end
            if(mxdata==mu4data)
                muxdata=mu4data;
                RuleBaseData(indexdata,1)=4;
            end
            if(mxdata==mu5data)
                muxdata=mu5data;
                RuleBaseData(indexdata,1)=5;
            end
        end  %%%%%%%%%%%%
       
       if(x>xmindata+3*stepxdata && x<xmindata+4*stepxdata)%Fuzzyset#4 and Fuzzyset#5
            mu4data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            mu5data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            if(mu4data>mu5data)
                muxdata=mu4data;
                RuleBaseData(indexdata,1)=4;
            end
            if(mu5data>mu4data)
                muxdata=mu5data;
                RuleBaseData(indexdata,1)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(x==xmindata+4*stepxdata)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu4data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            mu5data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            mu6data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            mxdata=mu4data;
            if(mu5data>mxdata)
                mxdata=mu5data;
            end
            if(mu6data>mxdata)
                mxdata=mu6data;
            end
            if(mxdata==mu4data)
                muxdata=mu4data;
                RuleBaseData(indexdata,1)=4;
            end
            if(mxdata==mu5data)
                muxdata=mu5data;
                RuleBaseData(indexdata,1)=5;
            end
            if(mxdata==mu6data)
                muxdata=mu6data;
                RuleBaseData(indexdata,1)=6;
            end
        end  %%%%%%%%%%%%%%%%
       if(x>xmindata+4*stepxdata && x<xmindata+5*stepxdata)%Fuzzyset#5 and Fuzzyset#6
            
            mu5data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            mu6data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            if(mu5data>mu6data)
                muxdata=mu5data;
                RuleBaseData(indexdata,1)=5;
            end
            if(mu6data>mu5data)
                muxdata=mu6data;
                RuleBaseData(indexdata,1)=6;
            end
            
        end  %%%%%%%%%%%%%%%%%%
        
        if(x==xmindata+5*stepxdata)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu5data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            mu6data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            mu7data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x);
            mxdata=mu5data;
            if(mu6data>mxdata)
                mxdata=mu6data;
            end
            if(mu7data>mxdata)
                mxdata=mu7data;
            end
            if(mxdata==mu5data)
                muxdata=mu5data;
                RuleBaseData(indexdata,1)=5;
            end
            if(mxdata==mu6data)
                muxdata=mu6data;
                RuleBaseData(indexdata,1)=6;
            end
            if(mxdata==mu7data)
                muxdata=mu7data;
                RuleBaseData(indexdata,1)=7;
            end
        end%%%%%%%%%%%%%%%%%
         if(x>xmindata+5*stepxdata && x<xmindata+6*stepxdata)%Fuzzyset#6 and Fuzzyset#7
            mu6data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            mu7data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x);
            if(mu6data>mu7data)
                muxdata=mu6data;
                RuleBaseData(indexdata,1)=6;
            end
            if(mu7data>mu6data)
                muxdata=mu7data;
                RuleBaseData(indexdata,1)=7;
            end
        end  %%%%%%%%%%%%
        
        if(x==xmindata+6*stepxdata)%Fuzzyset#6 and Fuzzyset#7
            mu6data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            mu7data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x);
            if(mu6data>mu7data)
                muxdata=mu6data;
                RuleBaseData(indexdata,1)=6;
            end
            if(mu7data>mu6data)
                muxdata=mu7data;
                RuleBaseData(indexdata,1)=7;
            end
        end%%%%%%%%%%%%%%%%
        
     %%%%%%%%%%%%%%%%Fuzzysets on YData
     
%      yd=Ytrain1(w,1);
%       yd=TrainData(w,2);
      yd=ydata(w,1);
      if(yd==ymindata)%Fuzzyset#1 and Fuzzyset#2
            mu1data=TriFuzzySetY(Fcentydata(1)-stepydata,Fcentydata(1),Fcentydata(1)+stepydata,yd);
            mu2data=TriFuzzySetY(Fcentydata(2)-stepydata,Fcentydata(2),Fcentydata(2)+stepydata,yd);
            if(mu1data>mu2data)
                muydata=mu1data;
                RuleBaseData(indexdata,2)=1;
            end
            if(mu2data>mu1data)
                muydata=mu2data;
                RuleBaseData(indexdata,2)=2;
            end
       end%%%%%%%%%%%%%%%%
        if(yd>ymindata && yd<ymindata+stepydata)%Fuzzyset#1 and Fuzzyset#2
            mu1data=TriFuzzySetY(Fcentydata(1)-stepydata,Fcentydata(1),Fcentydata(1)+stepydata,yd);
            mu2data=TriFuzzySetY(Fcentydata(2)-stepydata,Fcentydata(2),Fcentydata(2)+stepydata,yd);
            if(mu1data>mu2data)
                muydata=mu1data;
                RuleBaseData(indexdata,2)=1;
            end
            if(mu2data>mu1data)
                muydata=mu2data;
                RuleBaseData(indexdata,2)=2;
            end
        end%%%%%%%%%%%%%%%%
        if(yd==ymindata+stepydata)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1data=TriFuzzySetY(Fcentydata(1)-stepydata,Fcentydata(1),Fcentydata(1)+stepydata,yd);
            mu2data=TriFuzzySetY(Fcentydata(2)-stepydata,Fcentydata(2),Fcentydata(2)+stepydata,yd);
            mu3data=TriFuzzySetY(Fcentydata(3)-stepydata,Fcentydata(3),Fcentydata(3)+stepydata,yd);
            mxdata=mu1data;
            if(mu2data>mxdata)
                mxdata=mu2data;
            end
            if(mu3data>mxdata)
                mxdata=mu3data;
            end
            if(mxdata==mu1data)
                muydata=mu1data;
                RuleBaseData(indexdata,2)=1;
            end
            if(mxdata==mu2data)
                muydata=mu2data;
                RuleBaseData(indexdata,2)=2;
            end
            if(mxdata==mu3data)
                muydata=mu3data;
                RuleBaseData(indexdata,2)=3;
            end
            
        end%%%%%%%%%%%%%%%%%%%
        
        if(yd>ymindata+stepydata && yd<ymindata+2*stepydata)%Fuzzyset#2 and Fuzzyset#3
            mu2data=TriFuzzySetY(Fcentydata(2)-stepydata,Fcentydata(2),Fcentydata(2)+stepydata,yd);
            mu3data=TriFuzzySetY(Fcentydata(3)-stepydata,Fcentydata(3),Fcentydata(3)+stepydata,yd);
            if(mu2data>mu3data)
                muydata=mu2data;
                RuleBaseData(indexdata,2)=2;
            end
            if(mu3data>mu2data)
                muydata=mu3data;
                RuleBaseData(indexdata,2)=3;
            end
            
        end%%%%%%%%%%%%%%%%%
         if(yd==ymindata+2*stepydata)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu2data=TriFuzzySetY(Fcentydata(2)-stepydata,Fcentydata(2),Fcentydata(2)+stepydata,yd);
            mu3data=TriFuzzySetY(Fcentydata(3)-stepydata,Fcentydata(3),Fcentydata(3)+stepydata,yd);
            mu4data=TriFuzzySetY(Fcentydata(4)-stepydata,Fcentydata(4),Fcentydata(4)+stepydata,yd);
            mxdata=mu2data;
            if(mu3data>mxdata)
                mxdata=mu3data;
            end
            if(mu4data>mxdata)
                mxdata=mu4data;
            end
            if(mxdata==mu2data)
                muydata=mu2data;
                RuleBaseData(indexdata,2)=2;
            end
            if(mxdata==mu3data)
                muydata=mu3data;
                RuleBaseData(indexdata,2)=3;
            end
            if(mxdata==mu4data)
                muydata=mu4data;
                RuleBaseData(indexdata,2)=4;
            end
         end%%%%%%%%%%%%%%%%%%
        if(yd>ymindata+2*stepydata && yd<ymindata+3*stepydata)%Fuzzyset#3 and Fuzzyset#4
            mu3data=TriFuzzySetY(Fcentydata(3)-stepydata,Fcentydata(3),Fcentydata(3)+stepydata,yd);
            mu4data=TriFuzzySetY(Fcentydata(4)-stepydata,Fcentydata(4),Fcentydata(4)+stepydata,yd);
            if(mu3data>mu4data)
                muydata=mu3data;
                RuleBaseData(indexdata,2)=3;
            end
            if(mu4data>mu3data)
                muydata=mu4data;
                RuleBaseData(indexdata,2)=4;
            end
        end%%%%%%%%%%%%%%%%%%%
        if(yd==ymindata+3*stepydata)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu3data=TriFuzzySetY(Fcentydata(3)-stepydata,Fcentydata(3),Fcentydata(3)+stepydata,yd);
            mu4data=TriFuzzySetY(Fcentydata(4)-stepydata,Fcentydata(4),Fcentydata(4)+stepydata,yd);
            mu5data=TriFuzzySetY(Fcentydata(5)-stepydata,Fcentydata(5),Fcentydata(5)+stepydata,yd);
            mxdata=mu3data;
            if(mu4data>mxdata)
                mxdata=mu4data;
            end
            if(mu5data>mxdata)
                mxdata=mu5data;
            end
            if(mxdata==mu3data)
                muydata=mu3data;
                RuleBaseData(indexdata,2)=3;
            end
            if(mxdata==mu4data)
                muydata=mu4data;
                RuleBaseData(indexdata,2)=4;
            end
            if(mxdata==mu5data)
                muydata=mu5data;
                RuleBaseData(indexdata,2)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(yd>ymindata+3*stepydata && yd<ymindata+4*stepydata)%Fuzzyset#4 and Fuzzyset#5
            mu4data=TriFuzzySetY(Fcentydata(4)-stepydata,Fcentydata(4),Fcentydata(4)+stepydata,yd);
            mu5data=TriFuzzySetY(Fcentydata(5)-stepydata,Fcentydata(5),Fcentydata(5)+stepydata,yd);
            if(mu4data>mu5data)
                muydata=mu4data;
                RuleBaseData(indexdata,2)=4;
            end
            if(mu5data>mu4data)
                muydata=mu5data;
                RuleBaseData(indexdata,2)=5;
            end
        end%%%%%%%%%%%%%%%%
        if(yd==ymindata+4*stepydata)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu4data=TriFuzzySetY(Fcentydata(4)-stepydata,Fcentydata(4),Fcentydata(4)+stepydata,yd);
            mu5data=TriFuzzySetY(Fcentydata(5)-stepydata,Fcentydata(5),Fcentydata(5)+stepydata,yd);
            mu6data=TriFuzzySetY(Fcentydata(6)-stepydata,Fcentydata(6),Fcentydata(6)+stepydata,yd);
            mxdata=mu4data;
            if(mu5data>mxdata)
                mxdata=mu5data;
            end
            if(mu6data>mxdata)
                mxdata=mu6data;
            end
            if(mxdata==mu4data)
                muydata=mu4data;
                RuleBaseData(indexdata,2)=4;
            end
            if(mxdata==mu5data)
                muydata=mu5data;
                RuleBaseData(indexdata,2)=5;
            end
            if(mxdata==mu6data)
                muydata=mu6data;
                RuleBaseData(indexdata,2)=6;
            end
        end%%%%%%%%%%%%%%%
        if(yd>ymindata+4*stepydata && yd<ymindata+5*stepydata)%Fuzzyset#5 and Fuzzyset#6
            mu5data=TriFuzzySetY(Fcentydata(5)-stepydata,Fcentydata(5),Fcentydata(5)+stepydata,yd);
            mu6data=TriFuzzySetY(Fcentydata(6)-stepydata,Fcentydata(6),Fcentydata(6)+stepydata,yd);
            if(mu5data>mu6data)
                muydata=mu5data;
                RuleBaseData(indexdata,2)=5;
            end
            if(mu6data>mu5data)
                muydata=mu6data;
                RuleBaseData(indexdata,2)=6;
            end
            
        end%%%%%%%%%%%%%%%
        if(yd==ymindata+5*stepydata)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu5data=TriFuzzySetY(Fcentydata(5)-stepydata,Fcentydata(5),Fcentydata(5)+stepydata,yd);
            mu6data=TriFuzzySetY(Fcentydata(6)-stepydata,Fcentydata(6),Fcentydata(6)+stepydata,yd);
            mu7data=TriFuzzySetY(Fcentydata(7)-stepydata,Fcentydata(7),Fcentydata(7)+stepydata,yd);
            mxdata=mu5data;
            if(mu6data>mxdata)
                mxdata=mu6data;
            end
            if(mu7data>mxdata)
                mxdata=mu7data;
            end
            if(mxdata==mu5data)
                muydata=mu5data;
                RuleBaseData(indexdata,2)=5;
            end
            if(mxdata==mu6data)
                muydata=mu6data;
                RuleBaseData(indexdata,2)=6;
            end
            if(mxdata==mu7data)
                muydata=mu7data;
                RuleBaseData(indexdata,2)=7;
            end
        end%%%%%%%%%%%%%%%    
        
        if(yd>ymindata+5*stepydata && yd<ymindata+6*stepydata)%Fuzzyset#6 and Fuzzyset#7
            mu6data=TriFuzzySetY(Fcentydata(6)-stepydata,Fcentydata(6),Fcentydata(6)+stepydata,yd);
            mu7data=TriFuzzySetY(Fcentydata(7)-stepydata,Fcentydata(7),Fcentydata(7)+stepydata,yd);
            if(mu6data>mu7data)
                muydata=mu6data;
                RuleBaseData(indexdata,2)=6;
            end
            if(mu7data>mu6data)
                muydata=mu7data;
                RuleBaseData(indexdata,2)=7;
            end
        end%%%%%%%%%%%%%%
        if(yd==ymindata+6*stepydata)%Fuzzyset#6 and Fuzzyset#7
            mu6data=TriFuzzySetY(Fcentydata(6)-stepydata,Fcentydata(6),Fcentydata(6)+stepydata,yd);
            mu7data=TriFuzzySetY(Fcentydata(7)-stepydata,Fcentydata(7),Fcentydata(7)+stepydata,yd);
            if(mu6data>mu7data)
                muydata=mu6data;
                RuleBaseData(indexdata,2)=6;
            end
            if(mu7data>mu6data)
                muydata=mu7data;
                RuleBaseData(indexdata,2)=7;
            end
        end%%%%%%%%%%%%%
        %%%%location of Firing degree=muxdata*muydata=index3 of RuleBaseData Matrix
        RuleBaseData(indexdata,3)=(muxdata*muydata);
        
  end
  
  %% Delete Conflict and Same Rule Bases and Select one of them
  
  
  %%%% Create Final RuleBase

  
  
  RBDataFinal=zeros(7,1);
  FDegreeData=zeros(7,1);
  
  [ms,ns]=size(RBDataFinal );
  
  m1=size(RuleBaseData,1);
  for i=1:m1
     for j=1:ms
         
             if((RuleBaseData(i,1)==j) && (FDegreeData(j) <= RuleBaseData(i,3)))
                 RBDataFinal(j)=RuleBaseData(i,2);
                 FDegreeData(j)=RuleBaseData(i,3);
             end
           
         
     end
    
  end
  
  
  
disp('*************Part B***************')
disp('----------------------------------')
disp('Final Rule Base in PartB is:');
disp('RULES     X     Y');
disp('-----------------');
for i=1:7
    disp(['RULE#' num2str(i),'   X=',num2str(i), '   Y=', num2str(RBDataFinal(i))])
end
% disp(RBDataFinal);
 

%% Calculate MSE on Train Data

YhatTrainData=zeros(mt,1);%%%%mt=240=0.8*300
%%%% m=240 is the size of train data rows
for w=1:mt
    flag=0;
    x=Xtrain1(w,1);%% X train
    if(x==xmindata)%Fuzzyset#1 and Fuzzyset#2
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            num1=1;
            num2=2;
    end%%%%%%%%%%%%%%%
    if(x>xmindata && x<xmindata+stepxdata)%Fuzzyset#1 and Fuzzyset#2
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            num1=1;
            num2=2;
    end%%%%%%%%%%%%%%
     if(x==xmindata+stepxdata)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            mu3data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            num1=1;
            num2=2;
            num3=3;
            flag=1;
     end%%%%%%%%%%%%%
     if(x>xmindata+stepxdata && x<xmindata+2*stepxdata)%Fuzzyset#2 and Fuzzyset#3
            mu1data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            num1=2;
            num2=3;
     end%%%%%%%%%%%%
     if(x==xmindata+2*stepxdata)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu1data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            mu3data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            num1=2;
            num2=3;
            num3=4;
            flag=1;
     end%%%%%%%%%%%%%
      
     if(x>xmindata+2*stepxdata && x<xmindata+3*stepxdata)%Fuzzyset#3 and Fuzzyset#4
            mu1data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            num1=3;
            num2=4;
     end%%%%%%%%%%
     if(x==xmindata+3*stepxdata)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu1data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            mu3data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            num1=3;
            num2=4;
            num3=5;
            flag=1;
     end%%%%%%%%%%%%%
     if(x>xmindata+3*stepxdata && x<xmindata+4*stepxdata)%Fuzzyset#4 and Fuzzyset#5
            mu1data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            num1=4;
            num2=5;
     end%%%%%%%%%%%
     if(x==xmindata+4*stepxdata)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu1data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            mu3data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            num1=4;
            num2=5;
            num3=6;
            flag=1;
     end%%%%%%%%%%%%%
      if(x>xmindata+4*stepxdata && x<xmindata+5*stepxdata)%Fuzzyset#5 and Fuzzyset#6
            mu1data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            num1=5;
            num2=6;
      end%%%%%%%%%%%%%
      if(x==xmindata+5*stepxdata)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu1data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            mu3data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x);
            num1=5;
            num2=6;
            num3=7;
            flag=1;
      end%%%%%%%%%%%%
      if(x>xmindata+5*stepxdata && x<xmindata+6*stepxdata)%Fuzzyset#6 and Fuzzyset#7
            mu1data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x);
            num1=6;
            num2=7;
      end%%%%%%%%%%%%
       if(x==xmindata+6*stepxdata)%Fuzzyset#6 and Fuzzyset#7
            mu1data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x);
            mu2data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x);
            num1=6;
            num2=7;
       end%%%%%%%%%%
       
       %%   %%%%%%%% location of yhat and call zcoa
       
       if(flag==0)
           yhatdata=ZCOA2partB(num1,num2,mu1data,mu2data,RBDataFinal,stepydata,Fcentydata);
       end%%%%%%%%%%
       if(flag==1)
           yhatdata=ZCOA3partB(num1,num2,num3,mu1data,mu2data,mu3data,RBDataFinal,stepydata,Fcentydata);
       end%%%%%%%  
     
     YhatTrainData(w,1)=yhatdata;
end


MSETrainPartB=sum((YhatTrainData-Ytrain1).^2)/(2*mt);
disp('**************MSE Train PartB *************** ');
disp('----------------------------------------------');

disp(['MSE on Train Data PartB is:' num2str(MSETrainPartB)]) ;
disp('************************');
disp('************************');

   
     
     
  %% Calculate MSE on Test Data
  yh=zeros(60,100);
  MSETestData=zeros(100,1);
  p=60;%size(Xtest1,1);
  yhatTestdata=zeros(p,1);
  run=100;
  %%%%%%% 100 times RUN  %%%%%%% location of Run For
  
  
for i=1:run
     
    
      tdata=shuffle(data);
      TrainDatat=tdata(1:(0.8*md),:);
      TestDatat=tdata((0.8*md)+1:md,:);
      Xtest1=TestDatat(:,1);
      Ytest1=TestDatat(:,2);
      xmindata=min(tdata(:,1));
%     TestData=ShuffleTestData(TestData);
%     Xtest1=TestData(:,1);
%     Ytest1=TestData(:,2);
%     xmindata=min(xdata(:,1));

    
   for j=1:p
         flag=0;
         x2=Xtest1(j,1);%%%X Test
         if(x2==xmindata)%Fuzzyset#1 and Fuzzyset#2
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x2);
            num1=1;
            num2=2;
        end%%%%%%%%%%%%%%%
        if(x2>xmindata && x2<xmindata+stepxdata)%Fuzzyset#1 and Fuzzyset#2
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x2);
            num1=1;
            num2=2;
       end%%%%%%%%%%%%%%
       if(x2==xmindata+stepxdata)%Fuzzyset#1,Fuzzyset#2 and Fuzzyset#3
            mu1data=TriFuzzySetX(Fcentxdata(1)-stepxdata,Fcentxdata(1),Fcentxdata(1)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x2);
            mu3data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x2);
            num1=1;
            num2=2;
            num3=3;
            flag=1;
       end%%%%%%%%%%%%%
       if(x2>xmindata+stepxdata && x<xmindata+2*stepxdata)%Fuzzyset#2 and Fuzzyset#3
            mu1data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x2);
            num1=2;
            num2=3;
       end%%%%%%%%%%%%
       if(x2==xmindata+2*stepxdata)%Fuzzyset#2,Fuzzyset#3 and Fuzzyset#4
            mu1data=TriFuzzySetX(Fcentxdata(2)-stepxdata,Fcentxdata(2),Fcentxdata(2)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x2);
            mu3data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x2);
            num1=2;
            num2=3;
            num3=4;
            flag=1;
       end%%%%%%%%%%%%%
      
       if(x2>xmindata+2*stepxdata && x<xmindata+3*stepxdata)%Fuzzyset#3 and Fuzzyset#4
            mu1data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x2);
            num1=3;
            num2=4;
       end%%%%%%%%%%
       if(x2==xmindata+3*stepxdata)%Fuzzyset#3,Fuzzyset#4 and Fuzzyset#5
            mu1data=TriFuzzySetX(Fcentxdata(3)-stepxdata,Fcentxdata(3),Fcentxdata(3)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x2);
            mu3data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x2);
            num1=3;
            num2=4;
            num3=5;
            flag=1;
       end%%%%%%%%%%%%%
       if(x2>xmindata+3*stepxdata && x2<xmindata+4*stepxdata)%Fuzzyset#4 and Fuzzyset#5
            mu1data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x2);
            num1=4;
            num2=5;
       end%%%%%%%%%%%
       if(x2==xmindata+4*stepxdata)%Fuzzyset#4,Fuzzyset#5 and Fuzzyset#6
            mu1data=TriFuzzySetX(Fcentxdata(4)-stepxdata,Fcentxdata(4),Fcentxdata(4)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x2);
            mu3data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x2);
            num1=4;
            num2=5;
            num3=6;
            flag=1;
       end%%%%%%%%%%%%%
       if(x2>xmindata+4*stepxdata && x2<xmindata+5*stepxdata)%Fuzzyset#5 and Fuzzyset#6
            mu1data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x2);
            num1=5;
            num2=6;
       end%%%%%%%%%%%%%
       if(x2==xmindata+5*stepxdata)%Fuzzyset#5, Fuzzyset#6 and Fuzzyset#7
            mu1data=TriFuzzySetX(Fcentxdata(5)-stepxdata,Fcentxdata(5),Fcentxdata(5)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x2);
            mu3data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x2);
            num1=5;
            num2=6;
            num3=7;
            flag=1;
       end%%%%%%%%%%%%
       if(x2>xmindata+5*stepxdata && x2<xmindata+6*stepxdata)%Fuzzyset#6 and Fuzzyset#7
            mu1data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x2);
            num1=6;
            num2=7;
       end%%%%%%%%%%%%
       if(x2==xmindata+6*stepxdata)%Fuzzyset#6 and Fuzzyset#7
            mu1data=TriFuzzySetX(Fcentxdata(6)-stepxdata,Fcentxdata(6),Fcentxdata(6)+stepxdata,x2);
            mu2data=TriFuzzySetX(Fcentxdata(7)-stepxdata,Fcentxdata(7),Fcentxdata(7)+stepxdata,x2);
            num1=6;
            num2=7;
       end%%%%%%%%%%
       
       %%   %%%%%%%% location of yhat and call zcoa
       
       if(flag==0)
           yhatdata2=ZCOA2partB(num1,num2,mu1data,mu2data,RBDataFinal,stepydata,Fcentydata);
       end%%%%%%%%%%
       if(flag==1)
           yhatdata2=ZCOA3partB(num1,num2,num3,mu1data,mu2data,mu3data,RBDataFinal,stepydata,Fcentydata);
       end%%%%%%%  
     
       yhatTestdata(j,1)=yhatdata2;
       yh(j,i)=yhatdata2;
         
  end%%%%%%%%%%end of each level of 100 times
      
      MSETestData(i,1)=(sum( yhatTestdata-Ytest1).^2)/(2*60);%%%%p=60
      
      
end%%%%%end of 100 times RUN


MeanMSETestData=(sum(MSETestData)/run);
VarMSETestData=var(MSETestData);
StdMSETestData=std(MSETestData);
disp('**********************************');
disp('**********************************');
disp(['Final mean of MSE on Test Data PartB is:   ' num2str(MeanMSETestData)]);
disp('---------------------------')
disp(['Variance of MSE on Test Data is:     ' num2str(VarMSETestData)]);
disp('---------------------------');
disp(['Standard Deviation of MSE on Test Data is:    ' num2str(StdMSETestData)]);
% disp(StdMSETestData);
  
figure(2)
scatter(yhatTestdata,Xtest1,'filled');
title('Estimated 2D-shape of Test Data');

  
     
     
     
     
     
        
     
     
     
     
         





  
  
  
  
  
  
  
function  [result]=MakeChart(name,weightCount)
% ����ͼ��
% weightCount : ռ�ȸ������Ƿ�����������������
if isempty(name)
     error('���Ʊ����У�');
end
result=0;
data=[];
data2=[];
chartTitle=strcat(name,' volatility');
chartLegend=[];
%Load Datas 'Historical'
%1 His
model='His'; 
type='His';    
[Data,Data2,flag] = LoadData(model,type,name,weightCount);
if(flag==1)
    chartLegend=strcat(chartLegend,'''','Historical','''',',');
    data=[data Data];
    data2=[data2 Data2];
end
%2 DCC101_1
model='DCC'; 
type='DCC101_1';    
[Data,Data2,flag] = LoadData(model,type,name,weightCount)
if(flag==1)
    chartLegend=strcat(chartLegend,'''','DCC101_1','''',',');   
    data=[data Data'];
    data2=[data2 Data2'];
end
%3 DCC101_Every
model='DCC'; 
type='DCC101_Every';    
[Data,Data2,flag]  = LoadData(model,type,name,weightCount)
if(flag==1)
    chartLegend=[chartLegend,type,','];
    data=[data Data'];
    data2=[data2 Data2'];
end

%4 BEKK101_1
model='BEKK'; 
type='BEKK101_1';   
[Data,Data2,flag]  = LoadData(model,type,name,weightCount)
if(flag==1)
    chartLegend=strcat(chartLegend,'''',type,'''',',');
    data=[data Data'];
    data2=[data2 Data2'];
end

%5 Factor101_1
model='Factor'; 
type='Factor101_1';    
[Data,Data2,flag]  = LoadData(model,type,name,weightCount)
if(flag==1)
    chartLegend=strcat(chartLegend,'''',type,'''',',');
    data=[data Data'];
    data2=[data2 Data2'];
end
%6 Gogarch11_1
model='Gogarch'; 
type='Gogarch11_1'; 
[Data,Data2,flag]  = LoadData(model,type,name,weightCount)
if(flag==1)
    chartLegend=strcat(chartLegend,'''',type,'''',',');
    data=[data Data'];
    data2=[data2 Data2'];
end
chartLegend=strcat(chartLegend,'''',' ','''');
%7 chart
figure1=figure('Position',[0 30 1366 608]);
set(figure1,'visible','off');
set(figure1,'Position',[0 30 1366 608]);
plot(data);
set(gca,'xticklabel',{'2013-04-09','2013-05-09','2013-06-09','2013-07-09','2013-08-09','2013-09-09','2013-10-09','2013-11-09','2013-12-09','2014-01-08','2014-02-08','2014-03-08','2014-04-08'});
set(gca,'XTick',[1 22 44 66 88 110 132 154 176 198 220 242 261]);
title(chartTitle);
strcat('legend(',chartLegend,')');
eval(strcat('legend(',chartLegend,')'));
xlabel('Date');
ylabel('volatility');

f=getframe(gcf);
imwrite(f.cdata,[strcat('../Charts/',chartTitle,'.png')])
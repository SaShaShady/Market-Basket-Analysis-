

%Step 1--Import Dataset

%Step 2--Take only the AnnualIncome & Spedingscore columns(4 & 5)
Data=Data(:,4:5);
%Step 3--Perform Data Preprocessing
%Checking null value is present or not
sum(ismissing(Data))
%Standardization
Data.AnnualIncome=(Data.AnnualIncome-mean(Data.AnnualIncome))/std(Data.AnnualIncome);
Data.SpendingScore=(Data.SpendingScore-mean(Data.SpendingScore))/std(Data.SpendingScore);
%Convert the data from table to array 
Data=table2array(Data);
%Claculate the optimised k value using elbow curve
sa=[];
K=[];
for k=1:20
[idx c sumd]=kmeans(Data,k);
sa=[sa sum(sumd)];
K=[K k];
end
plot(K,sa);
%Original Model
[idx c]=kmeans(Data,5);
gscatter(Data(:,1),Data(:,2),idx);
hold on;
for i=1:5
    t=0:0.01:2*pi;
    x=c(i,1)+0.05*cos(t);
    y=c(i,2)+0.05*sin(t);
    fill(x,y,'k');
end

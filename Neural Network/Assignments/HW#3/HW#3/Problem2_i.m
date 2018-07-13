clear all;close all;clc;

Qq=[300 100 50];

Ptrain=zeros(1,Qq(1));
Ptrain=9*rand(size(Ptrain))+1;
Ttrain=exp(-Ptrain);

Ptest=zeros(1,Qq(2));
Ptest=9*rand(size(Ptest))+1;
Ttest=exp(-Ptest);

Pverif=zeros(1,Qq(3));
i=1:Qq(3);
Pverif(:,i)=1+(i-1)*(9/Qq(3));
Tverif=exp(-Pverif);

Tp=[0.01 1000 1 0.1 0];
M=15;
[W1,W2,E]=bp2(Ptrain,Ttrain,Ptest,Ttest,M,Tp);

Yverif=bp2val(Pverif,W1,W2,1);

figure;
axis([1 10 1 10]);
plot(Pverif,Tverif,'r.',Pverif,Yverif,'-');grid
xlabel('X');
ylabel('Network Prediction vs. True value');
legend('True value','Prediction');
title('Network Prediction and Verification data draw on the same graph');

figure;

xlabel('Prediction');
ylabel('Verification data');

axis([1 10 1 10]);i=1:0.1:10;
plot(i,i,'r-',Yverif,Tverif,'.');grid
title('Network Prediction vs. Verification data');
%plot(Pverif,Tverif,'r.',Pverif,Yverif,'-');grid
%legend('True value','Prediction');
%title('Network Prediction and Verification data draw on the same graph');
mse=norm(Tverif-Yverif)^2/length(Tverif);
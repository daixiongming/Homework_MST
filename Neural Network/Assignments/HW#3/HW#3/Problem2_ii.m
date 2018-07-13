clear all;close all;clc;

Qq=[200 100 50];

Ptrain=zeros(2,Qq(1));
Ptrain=4*rand(size(Ptrain))-2;
%Ttrain=exp(-Ptrain);
Ttrain=sin(pi*Ptrain(1,:)).*cos(pi*Ptrain(2,:));

Ptest=zeros(2,Qq(2));
Ptest=4*rand(size(Ptest))-2;
Ttest=sin(pi*Ptest(1,:)).*cos(pi*Ptest(2,:));
%Ttest=exp(-Ptest);

[X,Y]=meshgrid(-2:0.2:2);
Z=sin(pi*X).*cos(pi*Y);
mesh(X,Y,Z);
title('Function shape');
Pverif=[reshape(X,1,441);reshape(Y,1,441)];
Tverif=reshape(Z,1,441);

Tp=[0.02 8000 1 0.1 1];
M=20;
[W1,W2,E]=bp2(Ptrain,Ttrain,Ptest,Ttest,M,Tp);

Yverif=bp2val(Pverif,W1,W2,1);
figure;
axis([-1 1 -1 1]);
i=-1:0.02;1;
plot(i,i,'r-',Yverif,Tverif,'.');grid;
xlabel('Verification data');
ylabel('Network Prediction');
title('Network Prediction vs. Verification data');

figure;
X2=reshape(Pverif(1,:),21,21);
Y2=reshape(Pverif(2,:),21,21);
Z2=reshape(Yverif,21,21);
mesh(X2,Y2,Z2);
title('Network Output');


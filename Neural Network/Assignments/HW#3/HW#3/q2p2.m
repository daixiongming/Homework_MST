clear all;close all;
Qq=[200 100 50];% Number of train, validation and test samples

% Generate the training data
Ptrain=zeros(2,Qq(1));
Ptrain=4*rand(size(Ptrain))-2;
Ttrain=sin(pi*Ptrain(1,:)).*cos(pi*Ptrain(2,:));

% Generate the validation data
Pvalid=zeros(2,Qq(2));
Pvalid=4*rand(size(Pvalid))-2;
Tvalid=sin(pi*Pvalid(1,:)).*cos(pi*Pvalid(2,:));

% Generate the test data. This time choose sequaential points for
% plotting
[X,Y] = meshgrid(-2:0.2:2);
Z=sin(pi*X).*cos(pi*Y);
mesh(X,Y,Z);
title('Function shape');
Ptest=[reshape(X,1,441);reshape(Y,1,441)];
Ttest=reshape(Z,1,441);

% Train the network
Tp=[0.02 800 1 0.1 1];
% Tp(1): learning rate;
% Tp(2): maximum % number of iterations;
% Tp(3): slope of the activation function, f(x)=tanh(beta*x);
% Tp(4): stopping condition; The learning is stopped if the error for
% testing data increases by Tp(4)
% Tp(5): weights initialization option. if Tp(5)=0-random weights
% initialization; else use Nguyen-widrow initialization;
M=20;% Number of neurons in hidden layer

[W1,W2,E]=bp2(Ptrain,Ttrain,Pvalid,Tvalid,M,Tp);

% generate the plots for predicted data
Yverif=bp2val(Ptest,W1,W2,1);
figure;
axis([-1 1 -1 1]);
i=-1:0.02:1;
plot(i,i,'r-',Yverif, Ttest,'.'); grid;
xlabel('Verification data');
ylabel('Network Prediction');
title('Network Prediction vs. Verification data');
figure;
X2=reshape(Ptest(1,:),21,21);
Y2=reshape(Ptest(2,:),21,21);
Z2=reshape(Yverif,21,21);
mesh(X2,Y2,Z2);
title('Network Output');

% Calculate MSE for testing data 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Type your code here %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
mse=norm(Ttest-Yverif)^2/length(Yverif)
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% End of your code %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
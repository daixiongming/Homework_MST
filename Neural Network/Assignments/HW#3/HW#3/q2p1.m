clear all; close all; clc;
Qq=[300 100 50]; % Number of train, validation and test samples
% Generate the training data
Ptrain=zeros(1,Qq(1));
Ptrain=9*rand(size(Ptrain))+1;
Ttrain=exp(-Ptrain);

% Generate the validation data
Pvalid=zeros(1,Qq(2));
Pvalid=9*rand(size(Pvalid))+1;
Tvalid=exp(-Pvalid);

% Generate the test data. This time choose sequential points for plotting
Ptest=zeros(1,Qq(3));
i=1:Qq(3);
Ptest(:,i)=1+(i-1)*(9/Qq(3));
Ttest=exp(-Ptest);


% Train the network
Tp=[0.01 1000 1 0.1 0];
% Tp(1): learning rate;
% Tp(2): maximum % number of iterations;
% Tp(3): slope of the activation function, f(x)=tanh(beta*x);
% Tp(4): stopping condition; The learning is stopped if the error for
% testing data increases by Tp(4)
% Tp(5): weights initialization option. if Tp(5)=0-random weights
% initialization; else use Nguyen-widrow initialization;

M=15; % Number of neurons in hidden layer

% Function call for training 
[W1,W2,E]=bp2(Ptrain,Ttrain,Pvalid,Tvalid,M,Tp);

% generate the plot for predicted data
Yverif=bp2val(Ptest,W1,W2,1);
figure;
axis([1 10 1 10]);
plot(Ptest, Ttest,'r.',Ptest, Yverif,'-');grid;
xlabel('X');
ylabel('Network Prediction vs. True value');
legend('True value','Prediction');
title('Network Prediction and Verification data draw on the same graph');
figure;
xlabel('Prediction');
ylabel('Verification data');
axis([1 10 1 10]);
i=1:0.1:10;
plot(i,i,'r-',Yverif, Ttest,'.'); grid;
title('Network Prediction vs. Verification data');
% Calculate MSE for testing data 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Type your code here %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
mse=norm(Tverif-Yverif)^2/length(Tverif);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% End of your code %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

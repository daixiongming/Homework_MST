function [W1, W2, E]=bp2(Ptrain, Ttrain, Ptest, Ttest,M,Tp,W1,W2);
% BP2: MLP NN with one hidden layer trained using backpropagation
%
% [W1, W2, E]=bp2(Ptrain, Ttrain,Ptest, Ttest,M,Tp,W1,W2);
% Ptrain: n by Q matrix with Q, n-dimensional training input vectors.
% Ttrain: m by Q matrix with Q, m-dimensional training output vectors.
% Ptest: n by q matrix with q, n-dimensional testing input vectors.
% Ttest: m by q matrix with q, m-dimensional testing output vectors.
% M: number of neurons in the hidden layer
% Tp:training parameter vector
% Tp(1): learning rate;
% Tp(2): maximum % number of iterations;
% Tp(3): slope of the activation function, f(x)=tanh(beta*x);
% Tp(4): stopping condition; The learning is stopped if the error for
% testing data increases by Tp(4)
% Tp(5): weights initialization option. if Tp(5)=0-random weights
% initialization; else use Nguyen-widrow initialization;
% W1: weights from the input to the hidden layer (includes biases)
% W2: weights from the hidden layer to the output layer (includes bias)
% E: MSE history
[n,Q]=size(Ptrain);
[m,Q]=size(Ttrain);
q=length(Ttest);
% Parameter initialization
alpha=Tp(1); % learning rate
MaxIter=Tp(2); %maximum number of epochs
beta=Tp(3); %slope of the tanh activation function, f(x)=tanh(beta*x)
Incr=Tp(4); %maximum increase of the error for the test set
NgyWid=Tp(5); %NgyWid=0: random initialization;
%NgyWid=1: Nguyen-Widrow initialization
E=[];
MSEold=realmax;
MSEnew=realmax;
iter=0;

%% Network weights initialization                     
if nargin<8
if NgyWid==0
%random initialization
W1=0.1*randn(M,n+1);
W2=0.1*randn(m,M+1);
else
%Nguyen-Widrow initialization
gamma1=0.7*M^(1/n); % Eq.(3.58)
gamma2=0.7*m^(1/M); % Eq.(3.58)
W1=-0.5+rand(M,n);
W2=-0.5+rand(m,M);
b1=zeros(M,1);
b2=zeros(m,1);
for i=1:M
W1(i,:) = gamma1*W1(i,:)/norm(W1(i,:)); % Eq. (3.59)
b1(i) = (max(W1(i,:))-min(W1(i,:)))*rand(1,1)-mean(W1(i,:));
end
W1=[W1 b1];
for i=1:m
W2(i,:) = gamma2*W2(i,:)/norm(W2(i,:)); % Eq. (3.59)
b2(i) = (max(W2(i,:))-min(W2(i,:)))*rand(1,1)-mean(W2(i,:));
end
W2=[W2 b2];
end


%% Backpropogation code (20 pts)
MSE=zeros(MaxIter,1);
while iter<MaxIter&MSEnew<=(MSEold+Incr);
    iter=iter+1;
    MSEold=MSEnew;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% Type your code here %%%
    for i=1:Q
        v1=W1*[Ptrain(:,i)' 1]';
        xout1=tanh(beta*v1);
        g1=beta*(1-xout1.^2);
        v2=W2*[xout1' 1]';
        xout2=purelin(v2);
        g2=1;
        e=Ttrain(:,i)-xout2;
        MSE(iter)=MSE(iter)+e'*e/Q;
        D2=diag(g2)*e;
        D1=diag(g1)*W2(1:m,1:M)'*D2;
        W2=W2+alpha*D2*[xout1' 1];
        W1=W1+alpha*D1*[Ptrain(:,i)' 1];
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Note: use for loop to implement back propogation algorithm

    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% End of your code %%%
    MSEnew=norm(Ttest-bp2val(Ptest,W1,W2,beta))^2/q;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    E=[E;MSEnew]; % storing MSE of iteration
end

%% Generating error plot
figure;
loglog(MSE,'r');
hold on;loglog(E,'b');grid;
xlabel('Training epoch');
ylabel('MSE');
legend('Training MSE','Test MSE');
hold off;
end

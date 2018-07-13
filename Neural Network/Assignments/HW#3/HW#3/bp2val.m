function y=bp2val(P,W1,W2,beta);
%BP2VAL - output of the MLP NN with one hidden layer/ predicted values
%usage - y=bp2val(P,W1,W2,beta);
%
% P: n by Q matrix containing Q, n-dimensional input vectors
% W1: weights from the input to the hidden layer
% W2: weights from the hidden layer to the output layer
% beta: slope of the activation function, f(x)=tanh(beta*x)
% y: m by Q matrix containing Q, m-dimensional output vectors

[n,Q]=size(P);
[m,M]=size(W2);
% Forward step code (10 pts)
y=zeros(m,Q);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Type your code here %%%
for i=1:Q
    v1=W1*[P(:,i)' 1]';
    xout1=tanh(beta*v1);
    v2=W2*[xout1' 1]';
    xout2=purelin(v2);
    y(:,i)=xout2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% End of your code %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

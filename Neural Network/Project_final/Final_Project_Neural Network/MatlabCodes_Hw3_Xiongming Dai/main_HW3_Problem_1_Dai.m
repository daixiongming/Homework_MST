%Repair & Maintain_RVI codes for MDP 2017_HW3_problem 1
%Author: Xiongming Dai

close all; clear all; clc;
NA=2;   %action number
NS=31;   %state number
psi = 0.9;   %coefficient

% TPM of Action 1:Produce
P(:,:,1)=zeros(NS,NS);                 
P(1,2,1)=1;
P(NS,1,1)=1;
for i=2:NS-1
   for j=1:NS
    if j==1
       P(i,j)=1-psi^(i-1);
    elseif j==(i+1)
        P(i,j)=psi^(i-1);
    else 
        P(i,j) = 0;
    end
   end
end

% TRM of Action 1:Produce
R(:,:,1)=zeros(NS,NS);                             
R(:,1,1)= -450;
R(1,1,1)=0;

% TPM of Action 2:Maintain
P(:,:,2)=zeros(NS,NS);           
P(:,1,2)=1;
P(1,1,2)=0;

% TRM of Action 2:Maintain
R(:,:,2)=zeros(NS,NS);                             
R(:,1,2)= -175;
R(1,1,2)=0;

%condition for convergence or escape the loop
epsilon = 0.01;       
iter_num_max = 500;
disp('*********Solution for Problem 1, Homework 3, Xiongming Dai*******')
% Iteration Record 
i_star = 3;
[iter_num,J_iter,span,J_value,action] = func_HW3_Problem_1_RVI(P,R,NA,NS,i_star,epsilon,iter_num_max);
disp(['epsilon = ', num2str(epsilon), ';  psi = ', num2str(psi)])
disp(['i_star =  ', num2str(i_star)])
disp(['converge at : ', num2str(iter_num)])
disp(['Optimal policy : ', num2str(action)])
disp('Iteration history :'); disp(J_iter)
disp('J-value : '); disp(J_value);


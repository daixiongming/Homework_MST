function [iter_num,J_iter,span,J_value,action] = func_HW3_Problem_1(P,R,NA,NS,i_star,epsilon,iter_num_max)
J_old = zeros(1,NS);          % Initialize vector J = (J1,J2)
r_bar = zeros(NS,NA);
J_iter = zeros(1,NS);
iter_num = 0;

% Compute r_bar value (Average immediate rewards)
for i = 1:NS
    for a = 1:NA
        sum = 0;
        for j = 1:NS
            sum = sum + P(i,j,a)*R(i,j,a);
        end
        r_bar(i,a) = sum;
    end
end
   done =0;
   while 0==done
       iter_num=iter_num+1;
       for i=1:NS
           for a=1:NA
               sum=0;
               for j = 1:NS
                   sum = sum +P(i,j,a)*J_old(j);
               end
               Q(i,a) = r_bar(i,a)+sum;    
           end 
           [max_value,max_index] = max(Q(i,:));  
           J_value(iter_num,i) = max_value;
           action(i) = max_index;
       end
       for i=1:NS
        rho = max(Q(i_star,:));
        J_new(i) = max(Q(i,:))-rho;
        J_iter(iter_num,i) = J_new(i);
       end
       
       span(iter_num,1) = norm(J_new-J_old,inf);
       J_old = J_new;
       
       if span(iter_num,1) < epsilon
           done = 1;           
       end
       if iter_num > iter_num_max
           done = 1;
           disp('Does not converge,iteration number exceeds the maximum')
       end
   end
end
       
               

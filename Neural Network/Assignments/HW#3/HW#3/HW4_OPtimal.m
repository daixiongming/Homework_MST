clear;
syms S r q1 q2;
Q=sym('[q1 q2;q2 q1]');
S=sym('[s1 s2;s3 s4]');
A=[0 1;0 0];B=[0;1];S_N=[1 0;0 1];
R=[r 0;0 r];
ans=inv(B'*S*B+R);

S-(S*B)*ans*B'*S

AA=A'*(S-S*B*ans*B'*S)*A+Q

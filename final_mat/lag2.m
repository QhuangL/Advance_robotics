function [dq] = lag2(t, q)
q1 = q(1);
q2 = q(2);
dq1 = q(3);
dq2 = q(4);

kp = [100,100];
kv = [100,100];

d2q1 = -kp(1)*q1-kv(1)*dq1;
d2q2 = -kp(2)*q2-kv(2)*dq2;
    
dq = [dq1 ; dq2 ; d2q1 ; d2q2]; %
% l1 = 1;
% l2 = 1;
% m1 = 2;
% m2 = 2;
% lc1 = 0.5;
% lc2 = 0.5;
% i1 = m1*l1^2/12;
% i2 = m2*l2^2/12;
% g = 9.8;
% % g = 0;
% 
% 
% q1 = q(1);
% q2 = q(2);
% dq1 = q(3);
% dq2 = q(4);
% 
% D = [m1*lc1^2+m2*(l1^2+lc2^2+2*l1*lc2*cos(q2))+i1+i2 m2*(lc2^2+l1*lc2*cos(q2))+i2; ...
%      m2*(lc2^2+l1*lc2*cos(q2))+i2 m2*lc2^2+i2];
% 
% h = -m2*l1*lc2*sin(q2);
% C = [h*dq2 h*dq2+h*dq1; ...
%     -h*dq1 0];
% 
% phi = [(m1*lc1+m2*l1)*g*cos(q1)+m2*lc2*g*cos(q1+q2); ...
%         g*m2*lc2*cos(q1+q2)];
% 
% kp = [225 0; 0 220]; 
% kv = [325 0; 0 320];
% 
% l1 = 1.1;
% l2 = 0.9;
% m1 = 2.2;
% m2 = 1.8;
% lc1 = 0.5;
% lc2 = 0.4;
% i1 = m1*l1^2/12;
% i2 = m2*l2^2/12;
% 
% D1 = [m1*lc1^2+m2*(l1^2+lc2^2+2*l1*lc2*cos(q2))+i1+i2 m2*(lc2^2+l1*lc2*cos(q2))+i2; ...
%      m2*(lc2^2+l1*lc2*cos(q2))+i2 m2*lc2^2+i2];
% 
% C1 = [h*dq2 h*dq2+h*dq1; ...
%     -h*dq1 0];
% 
% phi1 = [(m1*lc1+m2*l1)*g*cos(q1)+m2*lc2*g*cos(q1+q2); ...
%         g*m2*lc2*cos(q1+q2)];
% 
% tau = D1*(kv*[-dq1;-dq2]+kp*[pi/2-q1;pi/3-q2])+C1*[dq1;dq2] + phi1;
%     
% d2q = D\(tau - C * [dq1; dq2] - phi);
% d2q1 = d2q(1);
% d2q2 = d2q(2);
% 
% dq = [dq1 ; dq2 ; d2q1 ; d2q2]; %

end
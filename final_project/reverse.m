function [q1, q2, q3, q4, u] = reverse(y, t)
global k1 k2 k3 k4
l1 = 1;
l2 = 1;
m1 = 2;
m2 = 2;
lc1 = 0.5;
lc2 = 0;
I1 = m1*l1^2/12;
I2 = m2*l2^2/3;
g = 9.8;
k = 10;

q1 = zeros(length(y(:,1)),1);
q2 = zeros(length(y(:,1)),1);
q3 = zeros(length(y(:,1)),1);
q4 = zeros(length(y(:,1)),1);
u = zeros(length(y(:,1)),1);

for i = 1: size(y(:,1),1)
    syms x1 x2 x3 x4
    y1 = y(i,1);
    y2 = y(i,2);
    y3 = y(i,3);
    y4 = y(i,4);
    
    eq1 = y1 == x1 + x3;
    eq2 = y2 == x2 + x4; 
    eq3 = y3 == (k*(x3 - pi/4) - g*cos(x1)*(l1*m2 + lc1*m1))/(m2*l1^2 + m1*lc1^2 + I1) - (k*(x3 - pi/4)*(m2*l1^2 + m1*lc1^2 + I1 + I2) - I2*g*cos(x1)*(l1*m2 + lc1*m1))/(I2*(m2*l1^2 + m1*lc1^2 + I1));
    eq4 = y4 == x4*(k/(m2*l1^2 + m1*lc1^2 + I1) - (k*(m2*l1^2 + m1*lc1^2 + I1 + I2))/(I2*(m2*l1^2 + m1*lc1^2 + I1)));
    eq = [eq1, eq2, eq3, eq4];
    
    S = solve(eq,[x1 x2 x3 x4]) ;
%     S.x2 = solve(eq,[x1 x2 x3 x4]);
%     S.x3 = solve(eq,[x1 x2 x3 x4]);
%     S.x4 = solve(eq,[x1 x2 x3 x4]);
    
    [qd, vd, ad, jd, dd] = traj(t(i), 2);

%     v = k1*(qd-y1)+ k2*(vd-y2) + k3*(ad-y3) + k4*(jd- y4) + dd;
    v = dd;

    q1(i) = S.x1;
    q2(i) = S.x2;
    q3(i) = S.x3;
    q4(i) = S.x4;
    u(i) = v;

end
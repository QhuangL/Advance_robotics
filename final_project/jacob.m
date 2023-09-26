
syms x1 x2 x3 x4 m1 m2 l1 l2 lc1 g I1 I2 k u v
% syms theta1 theta2 d1 d2

theta1 = (m1*lc1+m2*l1)*g*cos(x1);
theta2 = k*(x3-pi/4);
d1 = m1*lc1^2 + m2*l1^2 + I1 + I2;
d2 = I2;

D = [d1 d2; d2 d2];
B = [u-theta1; -theta2];
D\B;

f1 = x2;
f2 = (-theta1+theta2)/(d1-d2);
f3 = x4;
f4 = -(d1*theta2 - d2*theta1)/(d2*(d1 - d2));
% q1 = x2;
% q2 = (-theta2)/(d1-d2);
% q3 = x4;
% q4 = -(d1*theta2)/(d2*(d1 - d2));

x = [x1; x2; x3; x4];
f = [f1; f2; f3; f4];
gx = [0; 1/(d1 - d2); 0; -1/(d1 - d2)];

j1 = jacobian(f,x);  
ad1 = jacobian(g, x)*f - jacobian(f,x)*gx;    
ad2 = jacobian(ad1, x)*f - jacobian(f,x)*ad1;
ad3 = jacobian(ad2, x)*f - jacobian(f,x)*ad2;

ad = [gx, ad1, ad2, ad3];


% ad =[    0, -1/I1,                                      0, (k - g*sin(x1)*(l1*m2 + lc1*m1))/I1^2; ...
% 1/I1,     0, -(k - g*sin(x1)*(l1*m2 + lc1*m1))/I1^2,  (g*x2*cos(x1)*(l1*m2 + lc1*m1))/I1^2; ...
% 0,     0,                                      0,                            -k/(I1*I2); ...
% 0,     0,                              k/(I1*I2),                                     0];

syms y1 y2 y3 y4
y1 = x1 + x3;
y2 = x2 + x4;
y3 = jacobian(y2, x)*f;
y4 = jacobian(y3, x)*f;

u = (v- jacobian(y4,x)*f)
g = jacobian(y4, x)*gx


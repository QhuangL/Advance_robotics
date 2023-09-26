dt = 0.01;
t0 = 2;
tspan = 0:dt:t0;

l1 = 1;
l2 = 1;
m1 = 2;
m2 = 2;
lc1 = 0.5;
lc2 = 0.5;
I1 = m1*l1^2/12;
I2 = m2*l2^2/3;
g = 9.8;
k = 10;


y0 = [37.4/180*pi + 142.6/180*pi; 0; -25.5516; 0];


options = odeset('RelTol',1e-4,'AbsTol',1e-8); % solver options

[t,y] = ode45(@(t,y) pd_link(t,y), tspan, y0, options);
% [q1, q2, q3, q4, vt] = reverse(y, t);

% u_l = zeros(length(y(:,1)),1);
% for i = 1: size(y(:,1),1)
%     x1 = q1(i);
%     x2 = q2(i);
%     x3 = q3(i);
%     x4 = q4(i);
%     v = vt(i);
%     u_up = v + ((k/(m2*l1^2 + m1*lc1^2 + I1) - (k*(m2*l1^2 + m1*lc1^2 + I1 + I2))/(I2*(m2*l1^2 + m1*lc1^2 + I1)))*(k*(x3 - pi/4)*(m2*l1^2 + m1*lc1^2 + I1 + I2) - I2*g*cos(x1)*(l1*m2 + lc1*m1)))/(I2*(m2*l1^2 + m1*lc1^2 + I1));
%     u_down = -(k/(m2*l1^2 + m1*lc1^2 + I1) - (k*(m2*l1^2 + m1*lc1^2 + I1 + I2))/(I2*(m2*l1^2 + m1*lc1^2 + I1)))/(m2*l1^2 + m1*lc1^2 + I1);
%     ui = u_up/u_down;
%     u_l(i) = ui;
% end


for i = 1: size(y,1)
    
    plot([0, 1*cos(dq(i,1))],[0, 1*sin(dq(i,1))]);hold on
    plot([1*cos(dq(i,1)) , 1*cos(dq(i,1))+ 1*cos(dq(i,2)+dq(i,1))],[1*sin(dq(i)), 1*sin(dq(i,1))+ 1*sin(dq(i,2)+dq(i,1))]);
    xlim([-3 3])
    ylim([-3 3])
    title('2-link Arm (with g = 9.8)')
    xlabel('X')
    ylabel('Y')
    grid on
    pause(0.01) 
    clf  
end

dq=[q1 ,q3];
figure(1); clf
plot(t, dq(:,1)); hold on
plot(t,dq(:,2))
legend('joint1', 'joint2')
title('2link Arm with g = 9.8')
xlabel('t/s')
ylabel('angle/rad')
grid on

% figure(1); clf
% plot(t, y(:,1)); hold on
% plot(t,y(:,2))
% legend('y1=q1+q3', 'y2=q2+q4')
% title('2link Arm with g = 9.8')
% xlabel('t/s')
% ylabel('angle/rad')
% grid on

% figure(2); clf
% plot(t, u_l(:,1)); hold on
% legend('joint1 torque')
% title('2 link Arm torque')
% xlabel('t/s')
% ylabel('torque')
% grid on





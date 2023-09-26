% part 2
l1 = 1;
l2 = 1;
m1 = 2;
m2 = 2;
lc1 = 0.5;
lc2 = 0.5;
i1 = m1*l1^2/12;
i2 = m2*l2^2/12;
g = 9.8;
% g = 0;
d_fb = 15/9;

% x10 = 28.18/180*pi;
% x30 = 123.64/180*pi;
% x1f = 62.94/180*pi ;
% x2f = 0;
% x3f = 54.11/180*pi;
% x4f = 0;
% 
% x1_0 = 133.76/180*pi;
% x3_0 = 272.48/180*pi;
% x1_f = 142.48/180*pi;
% x3_f = 255.04/180*pi;
x10 = 28.18/180*pi;
x30 = 123.64/180*pi;
x1f = 48.91/180*pi ;
x3f = 82.18/180*pi;


x1_0 = 131.41/180*pi;
x3_0 = (277.18/180*pi);
x1_f = 144.35/180*pi;
x3_f = 251.3/180*pi;

% down 
% x10 = 28.18/180*pi;
% x30 = 123.64/180*pi;
% x1f = 12.02/180*pi ;
% x3f = 155.97/180*pi;
% 
% 
% x1_0 = 131.41/180*pi;
% x3_0 = (277.18/180*pi);
% x1_f = 119.58/180*pi;
% x3_f = 300.85/180*pi;


dt = 0.01;
q0 = [x1f-x10 ; x3f-x30 ; 0 ; 0];  %[q1 ; q2 ; dq1; dq2]
q0_0 = [x1_f-x1_0 ; x3_f-x3_0 ; 0 ; 0]; 
tspan = 0:dt:3;
options = odeset('RelTol',1e-4,'AbsTol',1e-8); % solver options

[t,de] = ode45(@(t,q) lag2(t,q), tspan, q0, options);
[t,de1] = ode45(@(t,q) lag2(t,q), tspan, q0_0, options);

figure(1); clf
% plot(t, x1f-de(:,1),'linewidth',4); hold on
% plot(t,x3f-de(:,2),'linewidth',4); hold on
% plot(t, x1_f-de1(:,1),'linewidth',4); hold on
% plot(t,x3_f-de1(:,2),'linewidth',4)
plot(t, de(:,3),'linewidth',1); hold on
% plot(t,de(:,4),'linewidth',1); hold on
plot(t, de1(:,3),'linewidth',1); hold on
% plot(t,de1(:,4),'linewidth',1)
title('Neck motor velocity')
legend('front-link1', 'back-link1')
% legend('front-link1', 'front-link2', 'back-link1', 'back-link2')
% title('Neck brace')
xlabel('t/s')
ylabel('angle/rad')
grid on
% for i = 1: size(de,1)
%     plot([0 + d_fb, 1*cos(x1f-de(i,1))+ d_fb],[0, 1*sin(x1f-de(i,1))], 'r','linewidth',4);hold on
%     plot([1*cos(x1f-de(i,1))+ d_fb , 1*cos(x1f-de(i,1))+ 1*cos(x3f-de(i,2)+x1f-de(i,1))+ d_fb],[1*sin(x1f-de(i)), 1*sin(x1f-de(i,1))+ 1*sin(x1f-de(i,1)+x3f-de(i,2))],'-r','linewidth',4);
%     plot([0, 1*cos(x1_f-de1(i,1))],[0, 1*sin(x1_f-de1(i,1))],'-b','linewidth',4);hold on
%     plot([1*cos(x1_f-de1(i,1)) , 1*cos(x1_f-de1(i,1))+ 1*cos(x3_f-de1(i,2)+x1_f-de1(i,1))],[1*sin(x1_f-de1(i)), 1*sin(x1_f-de1(i,1))+ 1*sin(x1_f-de1(i,1)+x3_f-de1(i,2))],'-b','linewidth',4);
%     
%     plot([1*cos(x1f-de(i,1))+ 1*cos(x3f-de(i,2)+x1f-de(i,1))+ d_fb, 1*cos(x1_f-de1(i,1))+ 1*cos(x3_f-de1(i,2)+x1_f-de1(i,1))], ...
%         [1*sin(x1f-de(i,1))+ 1*sin(x1f-de(i,1)+x3f-de(i,2)), 1*sin(x1_f-de1(i,1))+ 1*sin(x1_f-de1(i,1)+x3_f-de1(i,2))], 'k:', 'linewidth',4);
%     
%     plot([0, 0+d_fb], [0, 0], 'k', 'linewidth',4);
% %     plot3([0 + d_fb, 1*cos(x1f-de(i,1))+ d_fb],[0,0],[0, 1*sin(x1f-de(i,1))], 'r','linewidth',4);hold on
% %     
% %     plot3([1*cos(x1f-de(i,1))+ d_fb , 1*cos(x1f-de(i,1))+ 1*cos(x3f-de(i,2)+x1f-de(i,1))+ d_fb], ...
% %             [0,0],[1*sin(x1f-de(i)), 1*sin(x1f-de(i,1))+ 1*sin(x1f-de(i,1)+x3f-de(i,2))],'-r','linewidth',4);
% %     
% %     plot3([0, 1*cos(x1_f-de1(i,1))],[0,0],[0, 1*sin(x1_f-de1(i,1))],'-b','linewidth',4);hold on
% %     
% %     plot3([1*cos(x1_f-de1(i,1)) , 1*cos(x1_f-de1(i,1))+ 1*cos(x3_f-de1(i,2)+x1_f-de1(i,1))], ...
% %             [0,0],[1*sin(x1_f-de1(i)), 1*sin(x1_f-de1(i,1))+ 1*sin(x1_f-de1(i,1)+x3_f-de1(i,2))],'-b','linewidth',4);
% %     
% %     plot3([1*cos(x1f-de(i,1))+ 1*cos(x3f-de(i,2)+x1f-de(i,1))+ d_fb, 1*cos(x1_f-de1(i,1))+ 1*cos(x3_f-de1(i,2)+x1_f-de1(i,1))], ...
% %         [0,0],[1*sin(x1f-de(i,1))+ 1*sin(x1f-de(i,1)+x3f-de(i,2)), 1*sin(x1_f-de1(i,1))+ 1*sin(x1_f-de1(i,1)+x3_f-de1(i,2))], 'k:', 'linewidth',4);
% %     
% %     plot3([0, 0+d_fb],[0,0], [0, 0], 'k', 'linewidth',4);
%     xlim([-1 4])
%     ylim([-2.5 2.5])
% %     zlim([0, 2])
%     legend('front-link1', 'front-link2', 'back-link1', 'back-link2', 'jaw-plane', 'shoulder plane')
%     title('Neck brace (drop head)')
%     xlabel('X')
%     ylabel('Y')
%     grid on
%     pause(1e-5); 
%     clf 
% end

% dt = 0.01;
% q0 = [1/3*pi ; 1/4*pi ; 0 ; 0];  %[q1 ; q2 ; dq1; dq2]
% tspan = 0:dt:5;
% options = odeset('RelTol',1e-4,'AbsTol',1e-8); % solver options
% 
% [t,dq] = ode45(@(t,q) lag2(t,q), tspan, q0, options);
% 
% figure(1); clf
% plot(t, dq(:,1)); hold on
% plot(t,dq(:,2)); hold on
% legend('joint1', 'joint2')
% title('2link Arm with inaccurate torque')
% xlabel('t/s')
% ylabel('angle/rad')
% grid on


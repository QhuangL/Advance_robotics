dt = 0.01;
q0 = [1/3*pi ; 1/4*pi ; 0 ; 0];  %[q1 ; q2 ; dq1; dq2]
tspan = 0:dt:5;
options = odeset('RelTol',1e-4,'AbsTol',1e-8); % solver options

[t,dq] = ode45(@(t,q) lag(t,q), tspan, q0, options);

l1 = 1;
l2 = 1;
m1 = 2;
m2 = 2;
lc1 = 0.5;
lc2 = 0.5;
i1 = m1*l1^2/12;
i2 = m2*l2^2/12;
g = 9.8;

dV = [];
V= [];
for i = 1: size(dq,1)
    
    q1 = dq(i, 1);
    q2 = dq(i, 2);
    dq1 = dq(i, 3);
    dq2 = dq(i, 4);

    D = [m1*lc1^2+m2*(l1^2+lc2^2+2*l1*lc2*cos(q2))+i1+i2 m2*(lc2^2+l1*lc2*cos(q2))+i2; ...
         m2*(lc2^2+l1*lc2*cos(q2))+i2 m2*lc2^2+i2];

    h = -m2*l1*lc2*sin(q2);
    C = [h*dq2 h*dq2+h*dq1; ...
        -h*dq1 0];

    phi = [(m1*lc1+m2*l1)*g*cos(q1)+m2*lc2*g*cos(q1+q2); ...
            g*m2*lc2*cos(q1+q2)];

    kp = [225 0; 0 220]; 
    kv = [325 0; 0 320];
    tau = kp*[pi/2-q1; pi/3-q2] + kv*[0-dq1; 0-dq2];

    d2q = D\(tau - C * [dq1; dq2] - phi);
    d2q1 = d2q(1);
    d2q2 = d2q(2);
    
    dV =[dV, [dq1,dq2]*D*[d2q1;d2q2] - [dq1,dq2]*kp*[(pi/2-q1);(pi/3-q2)] + [dq1,dq2] ...
        *D*[dq1;dq2]/2];
    
    V = [V, [dq1,dq2]*D*[dq1;dq2]/2+[(pi/2-q1),(pi/3-q2)]*kp*[(pi/2-q1);(pi/3-q2)]/2];
end

figure(1); clf
subplot(2,1,1)
plot(t, dq(:,1)); hold on
plot(t,dq(:,2)); hold on
legend('joint1', 'joint2')
title('2link Arm with g = 9.8')
xlabel('t/s')
ylabel('angle/rad')
grid on

subplot(2,1,2)
plot(t, dV);hold on
plot(t, V);
legend('dV', 'V')
title('Liapunov Stability')
grid on

% for i = 1: size(dq,1)
%     plot([0, 1*cos(dq(i,1))],[0, 1*sin(dq(i,1))]);hold on
%     plot([1*cos(dq(i,1)) , 1*cos(dq(i,1))+ 1*cos(dq(i,2)+dq(i,1))],[1*sin(dq(i)), 1*sin(dq(i,1))+ 1*sin(dq(i,2)+dq(i,1))]);
%     xlim([-3 3])
%     ylim([-3 3])
%     title('2-link Arm (with g = 9.8)')
%     xlabel('X')
%     ylabel('Y')
%     grid on
%     pause(0.01) 
%     clf  
% end


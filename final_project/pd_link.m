function [dy] = pd_link(t, y)
global k1 k2 k3 k4
k1 = 20;
k2 = 20;
k3 = 20;
k4 = 20;

[qd, vd, ad, jd, dd] = traj(t, 2);

y1 = y(1);
y2 = y(2);
y3 = y(3);
y4 = y(4);


v = k1*(qd-y1)+ k2*(vd-y2) + k3*(ad-y3) + k4*(jd- y4) + dd ;

dy = [y2; y3; y4; v];
end
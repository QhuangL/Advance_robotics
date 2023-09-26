sysm x1f x2f x3f y1f y2f y3f x1b x2b x3b ...
    q1f q2f q1b q2b 

eq1 = sqrt((x3f-x3b)^2+(y3f-y3b)^2)==sqrt(15^2+ 5^2);
eq2 = x1f == x1b + 15;
eq3 = y1f == 0;
eq4 = y1b == 0;
eq5 = x2f == x1f + 9*cos(q1f);
eq6 = y2f == y1f + 9*sin(q1f);
eq7 = x3f == x2f + 9*cos(q1f+q2f);
eq8 = y3f == y2f + 9*sin(q1f+q2f);
eq9 = x1b == 0;
eq10 = x2f == x1b + 9*cos(q1b);
eq11 = y2f == y1b + 9*sin(q1b);
eq12 = x3f == x2b + 9*cos(q1b+q2b);
eq13 = y3f == y2b + 9*sin(q1b+q2b);
eq14 = x1b == 0;


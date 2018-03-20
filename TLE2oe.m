%TLE轨道根数换算
fprintf('请输入参数:i,Omega,e,w,M,n \n')
fprintf('i = ');i=input('');
fprintf('Omega = ');Omega=input('');
fprintf('e = ');e=input('');
fprintf('w = ');w=input('');
fprintf('M = ');M=input('');
fprintf('n = ');n=input('');
OneDay = 24 * 3600;       %一天多少秒
T = OneDay / n;     %轨道周期
a = ((T / (2 * pi))^(2/3)) * ((6.67e-11 * 5.976e24)^(1/3));
Mr = M * pi / 180;
E = Mr;
tol = 1;
while tol>1e-10
    E0 = E;
    E = E - (E - e * sin(E) - Mr)/(1 - e * cos(E));
    tol = abs(E - E0);
end
thetar = 2 * atan2( (sqrt((1 + e) / (1 - e)) * sin(E / 2) ),cos(E / 2));
theta = thetar * 180 / pi;
if theta<0
    theta  = theta + 360;
end
fprintf('经典轨道根数为：\n');
fprintf('---半长轴 a = %f m\n',a);
fprintf('---偏心率 e = %f \n',e);
fprintf('---轨道倾角 i = %f °\n',i);
fprintf('---升交点赤经 Omega = %f °\n',Omega);
fprintf('---近地点幅角 w = %f °\n',w);
fprintf('---真近点角 theta = %f °\n',theta);
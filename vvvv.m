function pos=vvvv(L)
syms us ue ps pee vs ve real

%% 通用3次多项式
a = [1, us, us^2, us^3
   0, 1, 2*us, 3*us^2
   1, ue, ue^2, ue^3
   0, 1, 2*ue, 3*ue^2] \ [ps; vs; pee; ve];
a = [simplify(a(1)), simplify(a(2)), simplify(a(3)), simplify(a(4))]';

%{
s = a0 + a1*u + a2*u^2 + a3*u^3
a0 = -(pe*us^3 - ps*ue^3 - 3*pe*ue*us^2 + 3*ps*ue^2*us - ue*us^3*ve
    + ue^3*us*vs + ue^2*us^2*ve - ue^2*us^2*vs)/(ue - us)^3
a1 = (ue^3*vs - us^3*ve - ue*us^2*ve + 2*ue^2*us*ve - 2*ue*us^2*vs
    + ue^2*us*vs - 6*pe*ue*us + 6*ps*ue*us)/(ue - us)^3
a2 = (3*pe*ue + 3*pe*us - 3*ps*ue - 3*ps*us - ue^2*ve - 2*ue^2*vs
    + 2*us^2*ve + us^2*vs - ue*us*ve + ue*us*vs)/(ue - us)^3
a3 = -(2*pe - 2*ps - ue*ve - ue*vs + us*ve + us*vs)/(ue - us)^3
%}

%% 归一化3次多项式
us = 0;
ue = 1;
ps = 0;
pee = 1;
vs = 1.5;
ve = 0;
a = eval(a);
%% 归一化3次多项式实例化
%L = 100;        %mm
vlim = 200;     %mm/s
dt = 0.01;     %s
T = (1.5 * L) / vlim;
t = 0 : dt : T;
u = t / T;
if abs(t(end) - T) > 1.0e-8
   t = [t, T];
   u = [u, 1];
end
s = a(1) + a(2) * u + a(3) * u.^2 + a(4) * u.^3;
v = a(2) + 2 * a(3) * u + 3 * a(4) * u.^2;
pos = L * s;
vel = (L / T) * v;
%
%/figure(2)
%set(gcf, 'color', 'w')
%subplot(2, 1, 1)
%plot(t, pos)
%hold on
%plot([0 T], [L L], 'r--')
%plot([T T], [0 L], 'r--')
%title('3次多项式位置曲线')
%xlabel('t/s')
%ylabel('pos/mm')
%box off%

%subplot(2, 1, 2)
%plot(t, vel)
%hold on
%plot(0.5*T, 1.5*L/T, 'ro')
%plot([0 0.5*T], [1.5*L/T 1.5*L/T], 'r--')
%plot([0.5*T 0.5*T], [0 1.5*L/T], 'r--')
%title('3次多项式速度曲线')
%xlabel('t/s')
%ylabel('vel/ mm/s')
%box off
%hold off
end

function [a,b]=linee(x,y,x1,y1) %直接输入两个bai坐标就可以du求出一条直zhi线方程。dao
if x~=x1
    a=(y1-y)/(x1-x);
    b=y-a*x;
else
    a=0;
    b=x;
end
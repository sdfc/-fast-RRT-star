function [a,b]=linee(x,y,x1,y1) %ֱ����������bai����Ϳ���du���һ��ֱzhi�߷��̡�dao
if x~=x1
    a=(y1-y)/(x1-x);
    b=y-a*x;
else
    a=0;
    b=x;
end
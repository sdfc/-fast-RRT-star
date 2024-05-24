close all;clear;
    x=1:0.5:10;
    y = sin(x);
    z = cos(x);
    k = x+y;
    plot(x,y,'r-');
    hold on;
    plot(x,z,'g-');
    hold on;
    ax = plot(x,k,'b-','tag','ax');
    %% 删除线条时执行以下代码
    h = findobj('type','line','tag','ax');
    delete(h);
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
    %% ɾ������ʱִ�����´���
    h = findobj('type','line','tag','ax');
    delete(h);
figure;
axis([0,200,0,200])
set(gca, 'XTick', 0:10:200)
set(gca, 'YTick', 10:10:200)
hold on
plot(30,3,'.r','MarkerSize', 30)
plot(4,40,'.b','MarkerSize', 30)
plot(4,40,'.g','MarkerSize', 30)
plot(4,40,'.m','MarkerSize', 70)
plot([100,100],[100,200], 'r', 'LineWidth', 2);
plot([100,100],[100,180], 'b', 'LineWidth', 2);
plot([100,100],[80,180], 'g', 'LineWidth', 2);
plot([100,100],[80,180], 'm', 'LineWidth', 2);
plot(160, 80,'or','MarkerSize', 9)
plot(160, 80,'ob','MarkerSize', 9)
plot(160, 80,'og','MarkerSize', 9)
plot(160, 80,'om','MarkerSize', 9)
plot([3,3],[5,5], '--b','LineWidth', 2);
plot([100,1],[100,180], 'k', 'LineWidth', 4);
plot(100, 80,'ok','MarkerSize', 11)
plot(4,40,'.k','MarkerSize', 40)
 legend({'������1���','������2���','������3���','������4���','������1����·��','������2����·��','������3����·��','������4����·��','������1Ŀ���','������2Ŀ���','������3Ŀ���','������4Ŀ���','��������ԭ·��','��̬�ϰ���','��̬�ϰ����ʼλ��','��̬�ϰ�������λ��'},'Location','northwest','NumColumns',4)
function circle1(x,y,r)
        ang=0:0.01:2*pi; 
        xp=r*cos(ang);
        yp=r*sin(ang);
        plot(x+xp,y+yp, '.r');
    end
function circle2(x,y,r)
        ang=0:0.01:2*pi; 
        xp=r*cos(ang);
        yp=r*sin(ang);
        plot(x+xp,y+yp, '.b');
    end
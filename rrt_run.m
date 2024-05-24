clear all;
figure;
hold on
global param
axis([0,200,0,200])
set(gca, 'XTick', 0:20:200)
set(gca, 'YTick', 20:20:200)
rect(0,40,40,20);
rect(0,40,40,20);
rect(110,0,20,40);
rect(160,20,20,20);
rect(130,60,30,40);
rect(140,90,40,20);
rect(70,80,40,40);
rect(30,100,20,20);
rect(80,140,40,20);
rect(20,160,40,40);
rect(120,180,20,20);
rect(160,130,40,40);
param.obstacles =[0,40,40,20;0,40,40,20;110,0,20,40;160,20,20,20;130,60,30,40;140,90,40,20;70,80,40,40;30,100,20,20;80,140,40,20;20,160,40,40;120,180,20,20;160,130,40,40];

startPoint=[20;20];
goalPoint=[190;190];
 
%  p_start = startPoint;
%  p_goal = goalPoint;
% startPoint=p_start ;
% goalPoint=p_goal;
param.threshold =2;
param.maxNodes = 2000;
param.step_size = 5; 
param.neighbourhood = 5;
param.random_seed = 40;

startPpoint=startPoint;
goalPpoint=goalPoint;
hold on
p_start=startPoint; % 起始点位置
p_goal=goalPoint; % 目标点位置

tic;
[rrt,PAth] = PlanPathRRTstar(param,startPoint,goalPoint);
toc;
PAth=fliplr(PAth);
p1=PAth';
p2=p1(1,:);
for i=1:size(p1,1)-1
    node1=p1(i,:);
    node2=p1(i+1,:);
    node=[(node1(1)+node2(1))/2,(node1(2)+node2(2))/2];
    p2=[p2;node;node2];
end
p=p2(1,:);
for i=1:size(p2,1)-1
    node1=p2(i,:);
    node2=p2(i+1,:);
    node=[(node1(1)+node2(1))/2,(node1(2)+node2(2))/2];
    p=[p;node;node2];
end
re3=p(1,:);
for i=1:length(p)-3  
    for t=0:0.01:1   
  
        b0=1/6*(1-t)^3;                       
        b1=1/6*(3.*t^3-6*t^2+4);        
        b2=1/6*(-3*t^3+3*t^2+3*t+1);     
        b3=1/6*t^3;                     
  
        x=b0*p(i,1)+b1*p(i+1,1)+b2*p(i+2,1)+b3*p(i+3,1);    
        y=b0*p(i,2)+b1*p(i+1,2)+b2*p(i+2,2)+b3*p(i+3,2);     

        re3=[re3;x y];
    end
end
re3=[re3;p(end,:)];
hold on
plot(re3(:,1),re3(:,2),'r','LineWidth', 3)
rob.x = p_start (1);
rob.y =p_start (2);
plot(rob.x,rob.y,'.r','MarkerSize', 30)
hold on
% text(rob.x+5, rob.y, 'S');
% text(p_goal(1), p_goal(2)+7, 'G');
plot(p_goal(1), p_goal(2),'.g','MarkerSize', 30)
% axis off
function[] = rect(x,y,l,b)
    hold on
    rectangle('Position',[x,y,l,b],'FaceColor',[0 0.1 0.1])
end



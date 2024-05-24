function [rrt,PAth] = PlanPathRRTstar(param, p_start, p_goal)
global field1 field2 field3 field4 field5 field6 Path_h
% RRT* 
% credit : Anytime Motion Planning using the RRT*, S. Karaman, et. al.
% calculates the path using RRT* algorithm 
% param : parameters for the problem 
%   1) threshold : stopping criteria (distance between goal and current
%   node)
%   2) maxNodes : maximum nodes for rrt tree 
%   3) neighborhood : distance limit used in finding neighbors
%   4) obstacle : must be rectangle-shaped #limitation
%   5) step_size : the maximum distance that a robot can move at a time
%   (must be equal to neighborhood size) #limitation
%   6) random_seed : to control the random number generation
% p_start : [x;y] coordinates
% p_goal : [x;y] coordinates
% variable naming : when it comes to describe node, if the name is with
% 'node', it means the coordinates of that node or it is just an index of
% rrt tree
% rrt struct : 1) p : coordinate, 2) iPrev : parent index, 3) cost :
% distance
% obstacle can only be detected at the end points but not along the line
% between the points
% for cost, Euclidean distance is considered.
% output : cost, rrt, time_taken 
% whether goal is reached or not, depends on the minimum distance between
% any node and goal 
field1 = 'p';
    field2 = 'iPrev';
    field3 = 'cost';
    field4 = 'goalReached';
    field5 = 'finalcost';
    field6 = 'timetaken';
   

rng(param.random_seed);
tic;
start();

    function start()      
        rrt(1) = struct(field1, p_start, field2, 0, field3, 0, field4, 0,field5,0,field6,0);  
        N = param.maxNodes; % iterations
        j = 1;
        rand_sample=[];
        while j<=N                     
            [sample_node,rand_sample] = getSample(rand_sample,p_goal);
            nearest_node_ind = findNearest(rrt, sample_node);
            new_node = steering(rrt(nearest_node_ind).p, sample_node);
            if (isObstacleFree1(new_node)==1)
%                 neighbors_ind = getNeighbors(rrt, new_node);
                rrt=chooseParent(rrt, nearest_node_ind,new_node) ; 
            end
             if norm(new_node-p_goal) <6
% %                       rrt = setReachGoal(rrt);
%                        if j>700
%                          [rrt,PAth]=setPath(rrt);
%                           toc
%                       end
                         
                   
                  end
            j = j + 1;
        end
        [rrt,PAth]=setPath(rrt);
    end   
    function [rrt,PAth]=setPath(rrt)  
        
         total_distance=0;
        for i = 1: length(rrt)-1
            p1 = rrt(i).p;
            rob.x = p1(1); rob.y=p1(2);
            plot(rob.x,rob.y,'.b')
            child_ind = find([rrt.iPrev]==i);
            for j = 1: length(child_ind)
                p2 = rrt(child_ind(j)).p;
                plot([p1(1),p2(1)], [p1(2),p2(2)], 'b', 'LineWidth', 1);
            end
        end 
        PAth=p_goal;
        [cost,i] = getFinalResult(rrt);
%           plot([rrt(i).p(1),p_goal(1)],[rrt(i).p(2),p_goal(2)], 'r', 'LineWidth', 3);
        result.cost = cost+norm(rrt(i).p-p_goal);
        result.rrt = [rrt.p];
        while i ~= 0
            p11 = rrt(i).p;
            PAth=[PAth p11];
%              plot(p11(1),p11(2),'r', 'Marker','.', 'MarkerSize', 10);
            i = rrt(i).iPrev;
            if i ~= 0
                p22 = rrt(i).p;                
%                 plot(p22(1),p22(2),'r', 'Marker', '.', 'MarkerSize', 10);
%                  plot([p11(1),p22(1)],[p11(2),p22(2)], 'r', 'LineWidth', 3);
                distance=sqrt((p11(1)-p22(1))^2+(p11(2)-p22(2))^2);
                total_distance=total_distance+distance;
            end 
        end  
        result.time_taken = toc;
        disp(total_distance);
    end
    function [value,min_node_ind] = getFinalResult(rrt)
        goal_ind = find([rrt.goalReached]==1);
        if ~(isempty(goal_ind))
            disp('Goal has been reached!');
            rrt_goal = rrt(goal_ind);
            value = min([rrt_goal.cost]);
            min_node_ind = find([rrt.cost]==value);
            if length(min_node_ind)>1
                min_node_ind = min_node_ind(1);
            end
        else
            disp('Goal has not been reached!');
            for i =1:length(rrt)
                norm_rrt(i) = norm(p_goal-rrt(i).p);
            end
            [value,min_node_ind]= min(norm_rrt); 
            value = rrt(min_node_ind).cost;
        end
    end
    
   
    
    function new_node=steering(nearest_node, random_node)
       dist = norm(random_node-nearest_node);
       ratio_distance = param.step_size/dist;
       
       x = (1-ratio_distance).* nearest_node(1)+ratio_distance .* random_node(1);
       y = (1-ratio_distance).* nearest_node(2)+ratio_distance .* random_node(2);       
       new_node = [x;y];
    end
    
    
    function [node,rand_sample] = getSample(rand_sample,p_goal)
         if rand()<0.5
              node=p_goal;
              rand_sample=rand_sample;
         else
            x = 0;
            y = 0;
            a = 0;
            b = 200;
            node = [x;y];
            node(1) = (b-a) * rand(1) + a;
            node(2) = (b-a) * rand(1) + a; 
            if  size(rand_sample,2)~=0              
                    while 1
                          if   abs(rand_sample(1,end)-p_goal(1))>abs(node(1)-p_goal(1))||abs(rand_sample(2,end)-p_goal(2))>abs(node(2)-p_goal(2))
                             rand_sample=[rand_sample,node];
                             break;
                         end
                         node(1) = (b-a) * rand(1) + a;
                         node(2) = (b-a) * rand(1) + a;     
                    end
            else
                rand_sample=[rand_sample,node];
            end
         end
    end 
  function rrt = reWire(rrt, neighbors, new)
        for i=1:length(neighbors)
            cost = rrt(new).cost + norm(rrt(neighbors(i)).p - rrt(new).p); 
            if (cost<rrt(neighbors(i)).cost)
                rrt(neighbors(i)).iPrev = new;
                rrt(neighbors(i)).cost = cost;
            end
        end
    end
end
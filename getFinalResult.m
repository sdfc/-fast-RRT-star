function [value,min_node_ind] = getFinalResult(PAth_h)
global goalPoint
        goal_ind =[];
        if ~(isempty(goal_ind)) 
            rrt_goal = rrt(goal_ind);
            value = min([rrt_goal.cost]);
            min_node_ind = find([rrt.cost]==value);
            if length(min_node_ind)>1
                min_node_ind = min_node_ind(1);
            end
        else
            disp('Goal has not been reached!');
            for i =1:length(PAth_h)
                norm_rrt(i) = norm(goalPoint-[PAth_h(i,1);PAth_h(i,2)]);
            end
            [value,min_node_ind]= min(norm_rrt); 
            value = PAth_h(min_node_ind,4);
        end
    end
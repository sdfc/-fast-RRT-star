function neighbors = getNeighbors(rrt, node)
      global param
        neighbors = [];
        for i = 1:length(rrt)-1
            dist = norm(rrt(i).p-node);
            if (dist<=param.neighbourhood)
               neighbors = [neighbors i];
            end
        end        
    end
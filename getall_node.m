function all_node = getall_node(rrt, node,nearest_node_ind)%node为新节点newnode
        all_node = [node;length(rrt)];
        node__=[rrt(nearest_node_ind).p;nearest_node_ind];
        all_node=[all_node node__];
        while 1
            parent_index=rrt(nearest_node_ind).iPrev;
            if (parent_index==0) 
                break;
            end
            node__=[rrt(parent_index).p;parent_index];
            all_node=[all_node node__];
            nearest_node_ind=parent_index;
           
        end        
     end

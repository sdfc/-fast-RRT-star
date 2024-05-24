function rrt = insertNode(rrt, parent, new_node)
        global field1 field2 field3 field4 field5 field6 Path_h
        rrt(end+1) = struct(field1, new_node, field2, parent, field3, rrt(parent).cost + norm(rrt(parent).p-new_node), field4, 0,field5,0,field6,0);
    end
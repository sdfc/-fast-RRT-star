function cost = getCostFromRoot(PAth_h, parent, child_node)       
       cost =  PAth_h(parent,4)+ norm(child_node -  PAth_h(parent,1:2));
    end
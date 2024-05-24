 function free=isObstacleFree1(node_free)
        global param
        free = 1;
        for i = 1: length(param.obstacles(:,1))
            obstacle = param.obstacles(i,:);
            op1 = [obstacle(1), obstacle(2)];
            op2 = [op1(1)+obstacle(3), op1(2)];
            op3 = [op2(1), op1(2) + obstacle(4)];
            op4 = [op1(1), op3(2)];
            
            nx = node_free(1);
            ny = node_free(2);
            
            if ((nx>=(op1(1)-3) && nx<=(op2(1)+3)) && ((ny>=op1(2)-3) && (ny<=op4(2)+3)))
                free = 0;
            end
        end 
    end
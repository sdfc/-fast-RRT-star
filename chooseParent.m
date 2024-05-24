function  rrt=chooseParent(rrt, nearest_node_ind,new_node)
          [insert_point] = insert(rrt(nearest_node_ind).p,new_node,10);        
         insert_point(end,:)=[];
            xianduan=1;
            for  di=1:size(insert_point,1)
                node=[insert_point(di,1);insert_point(di,2)];
                if(isObstacleFree1(node)==0)%1Œﬁ’œ∞≠,0”–’œ∞≠
                xianduan=0;
                 break;
                end
            end
            if (isObstacleFree1(new_node)==1 && xianduan==1)
                all_node = getall_node(rrt, new_node,nearest_node_ind);
                rrt = insertNode(rrt, nearest_node_ind, new_node);
                 s=1;
                 si=2;
        while s
            node_1= new_node;
            node_2=all_node(1:2,si);
            insert_p=15;      
            [insert_point] = insert(node_2,node_1,insert_p);
            insert_point(end,:)=[];
            for  di=1:size(insert_point,1)
                node=[insert_point(di,1);insert_point(di,2)];
                if(isObstacleFree1(node)==0)%1Œﬁ’œ∞≠,0”–’œ∞≠
                    cost=rrt(all_node(3,si-1)).cost + norm(rrt(all_node(3,si-1)).p - node_1);
                     rrt(length(rrt)).iPrev = all_node(3,si-1);
                    rrt(length(rrt)).cost = cost;
                    s=0;
                    break;
                end
            end
            if s==0
                break;
            end
            if si==size(all_node,2)
                cost=rrt(all_node(3,si)).cost+norm(rrt(all_node(3,si)).p-node_1);
                 rrt(length(rrt)).iPrev = all_node(3,si);
                    rrt(length(rrt)).cost = cost;
                break;
            end
            si=si+1;   
        end
            end
end
function [insert_point] = insert(node_2,node_1,insert_p)
     node2=[node_2(1),node_2(2)];
     node1=[node_1(1),node_1(2)];
    dist_rand = pdist2(node2,node1);
     vector_dir =node2-node1;
     vector_dir = vector_dir./dist_rand;
    dist_new2near = norm(node2 - node1);
    dist_gap = dist_new2near/insert_p;
    ii =1:insert_p;
    insert_point = repmat(node1,insert_p,1)+ii'.*dist_gap* vector_dir;
    end 
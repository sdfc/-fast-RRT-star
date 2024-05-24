function path_r=get_path(rrt,start_r,n_index)
    l_r=1;
    path_r=start_r;
    ri=n_index;
    while  l_r
        path_r=[path_r,rrt(ri).p];  
        ri=rrt(ri).iPrev;
        if ri==0
             l_r=0;
         end
    end
    PAth_h=[];
    for i=1:size(path_r,2)-1
        point_1=path_r(:,i);
        point_2=path_r(:,i+1);
        distance=sqrt((point_1(1)-point_2(1))^2+(point_1(2)-point_2(2))^2);
        insert_p=round(distance/2);
        [insert_point] = insert(point_2,point_1,insert_p);
        PAth_h=[PAth_h point_1 insert_point' point_2];
    end
    path_r=PAth_h;
end
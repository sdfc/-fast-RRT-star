function indx = findNearest(rrt, n)
        mindist = norm(rrt(1).p - n);
        indx = 1;
        for i = 2:length(rrt)
            dist = norm(rrt(i).p - n);
            if (dist<mindist)
               mindist = dist;
               indx = i;
            end
        end
    end 
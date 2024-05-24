% obj1_Posotion is th ecenter point of the circle
function obj_nextPos = moveObj(obj_centerPoint,pre_obs,obj_case)

obj_x = obj_centerPoint(1);
obj_y = obj_centerPoint(2);

movable = false;

% 1:left+up(--); 2:up(=-); 3:right+up(+-),4:left(-=),
% 5:right(+=),6:left+down(-+), 7:down(=+), 8:right+down(++)
if obj_case==1%左下
        if obj_x-1  > 1 
            obj_x = obj_x - 0.1;
        else
            obj_x = 199.9;
        end
        if obj_y -1  > 1 
            obj_y = obj_y - 0.1;
        else
            obj_y = 199.9;
        end
    elseif obj_case==2%下
        if obj_y -1 > 1
            obj_y = obj_y - 0.1;
        else
            obj_y =199.9;
        end
    elseif obj_case==3%右下
        if obj_x < 199 && obj_x > 1
            obj_x = obj_x + 0.1;
        else
            obj_x = 1.9;
        end
        if obj_y -1 > 1
            obj_y = obj_y - 0.1;
        else
            obj_y = 199.9;
        end
    elseif obj_case==4%左
        if obj_x -1 > 1
            obj_x = obj_x - 0.1;
        else
            obj_x = 199.9;
        end
    elseif obj_case==5%右
        if obj_x < 199 && obj_x > 1
            obj_x = obj_x + 0.1;
        else
            obj_x = 199.9;
        end
    elseif obj_case==6%左上
        if obj_x -1 > 1
            obj_x = obj_x - 0.1;
        else
            obj_x = 199.9;
        end
        if obj_y < 199 && obj_y > 1
            obj_y = obj_y + 0.1;
        else
            obj_y = 1.9;
        end
    elseif obj_case==7%上
        if obj_y < 199 && obj_y > 1
            obj_y = obj_y + 0.1;
        else
            obj_y = 1.9;
        end
    elseif obj_case==8%右上
        if obj_x < 199 && obj_x > 1
            obj_x = obj_x + 0.1;
        else
            obj_x = 199.9;
        end
        if obj_y < 199 && obj_y > 1
            obj_y = obj_y + 0.1;
        else
            obj_y = 199.9;
        end


end
obj_nextPos = [obj_x-1, obj_y-1, 2, 2];
end



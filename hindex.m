function [h] = hindex(A)
%calculates the h-index of nodes in a network as explained in 
%"The H-index of a network node and its relation to degree and coreness" by Lü, Linyuan Zhou, Tao Zhang, Qian-Ming Stanley, H. Eugene
%h - h-index
%A - Adjacency matrix
    [deg,indeg,outdeg] = degrees(A);
    num_of_nodes = size(A,1);
    for i = 1:num_of_nodes
        neigh = kneighbors(A,i,1);
        neigh_deg = [];
        for j = 1:size(neigh,2)
            neigh_deg(j) = deg(neigh(j));
        end
        x = [0 (1:size(neigh_deg,2)) size(neigh_deg,2)];
        y = [max(neigh_deg) sort(neigh_deg,'descend') 0];
    %     mapshow(x,y,'Marker','+')

        for j = 1:max(neigh_deg)
            x1 = [0 j];
            y1 = [0 j];
    %         mapshow(x1,y1,'Marker','*')
            [xint, yint] = polyxpoly(x, y, x1, y1);

            if isempty(xint) == 0
                if round(xint) == xint
                    h(i) = j;
                else
                    h(i) = j-1;
                end
                break
            end
    %         mapshow(xint,yint,'DisplayType','point','Marker','o')
        end

    end
end
function [chosen_matrix] = chose_nodes(c,num_groups,from_group)
%Takes the list of values c and sorts it. Splits the list in n groups and
%picks m nodes from each group. Returns the mxn matrix of chosen nodes
%(IDs). If m is empty matrix it takes n nodes from the sorted range of nodes
%in regular distances.

n = num_groups;
m = from_group;

%sort and keep indices
ind = (1:size(c,2));
I = sortrows([c' ind'],[-1 -2]);
chosen_matrix = [];
if (~isempty(m))
    %split list in n groups
    num_elem = (size(c,2)-mod(size(c,2),n))/n;
    groups = [];
    for i = 0:n-1
        g = I(i*num_elem+1:(i+1)*num_elem,2);
        groups = [groups g];
    end
    
    %chose m random elements from each group
    ch_all = [];
    for i = 1:size(groups,2)
        ch = [];
        for j = 1:m
            chosen = round(randi(size(groups,1),1,1));
            ch = [ch groups(chosen,i)];
            %         ch = [ch groups(4,i)];
        end
        ch_all = [ch_all;ch];
    end
    chosen_matrix = ch_all;
else
    step = (size(c,2)-mod(size(c,2),n))/n;
    for i = 1:n
        g = I(i*step,2);
        chosen_matrix = [chosen_matrix;g];
    end
end
end
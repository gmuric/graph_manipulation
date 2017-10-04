function [distinct] = chose_distinct(c,size_c)
%takes the array c and choses the "size_c" of unique indices. If number of
%uniques is smaller than "size_c" it fills the difference with indices
%of those which have c=1. For example, if there is degree sequence [5 5 4 4 2 1
%1 1] and size_c = 6, the result is [1 3 5 6 7 8].
[~,b,~] = unique(c);
b = b';
b = fliplr(b);
if size(b,2) > size_c
    distinct = b(1:size_c);
else
    add_nodes = find(c==4,size_c-size(b,2)+1);
    add_nodes = add_nodes(2:end);
    distinct = [b add_nodes];
end

end
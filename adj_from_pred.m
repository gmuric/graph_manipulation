function [A] = adj_from_pred(pred)
%Makes adjacancy matrix (A) from the list of predecessors (pred)
num_of_nodes = length(pred);
ST1 = zeros(num_of_nodes,3);

for j = 1:num_of_nodes
    ST1(j,1) = pred(j);
    ST1(j,2) = j;
    ST1(j,3) = 1;
end

TF1 = ST1(:,1) == 0;
ST1(TF1,:) = [];
ST1(any(isnan(ST1), 2), :) = [];
A = adj_from_list(ST1,num_of_nodes);
end


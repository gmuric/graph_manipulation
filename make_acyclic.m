function [B] = make_acyclic(A,parent_node)
%takes a list of edges in form of a matrix (3 x m) and returns
%the acyclic graph with respect to the parent node in the sparse form
%The algorithm keeps the neighbourhood of the parent node. The more away we
%go from the parent node, the larger probability of edge removal.
%This does NOT create an acyclic graph by removing MINIMAL number of edges.
%It is made to optimize (to keep) the neighbourhood of the parent node

[dist, ~, pred] = graphshortestpath(sparse(edgeL2adj(A)), parent_node);
tree = adj_from_pred (pred);

% ADD only links which are wanted
%remove tree links in both directions
bitree = tree + tree';
remaining = edgeL2adj(A)-bitree;
remaining = adj2edgeL(remaining);
%go through the remaining edges and return the wanted ones
%the algorithm goes throught the remaining edges in respect to the distance
%of the parent node. First the edges close to the parent node are assessed and returned in case they don't make cycle.

ind = [1:length(pred)];
sort1 = [dist' ind'];
[~,I] = sort(sort1(:,1));
sorted = sort1(I,:);

tree = sparse(tree);
%now we have a tree and we are adding edges to the tree from the set of
%remaining edges if there are remaining edges
if size(remaining,1) ~= 0
    for i = 1:size(sorted,1)
        r = remaining(remaining(:,1)==sorted(i,2),:);
        for j = 1: size(r,1)
            %add edge and check if it makes cycle. If there is a cycle, remove
            %it. If there are no cycles, keep it.
            tree(r(j,1),r(j,2)) = 1;
            if graphisdag(tree)==0
                tree(r(j,1),r(j,2)) = 0;
            end
        end
    end
end
B = tree;
end


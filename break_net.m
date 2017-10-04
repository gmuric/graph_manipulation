function [B] = break_net(A,parent_node,d)
%Keeps only the neighbourhood of the parent node. Takes a network A in form of a 
%list of the edges and makes a subnet which is consisted of parent node and 
%all nodes which are reachable in d steps (at d distance from the parent node).
%The algorithm keeps all edges within %those nodes and breaks edges with excluded nodes.
%The parent node takes the indice 1

[dist, ~, ~] = graphshortestpath(sparse(edgeL2adj(A)), parent_node);
% tree = adj_from_pred (pred);

nodes = find(dist <= d);

[b1,~] = ismember(A(:,1),nodes,'R2012a');
[b2,~] = ismember(A(:,2),nodes,'R2012a');

remove = [b1 b2];

rows_to_remove = any(remove==0, 2);
A(rows_to_remove,:) = [];

ind = 1:length(unique(A(:,1:2)));

I = find(unique(A(:,1:2)) == parent_node);
ind(I) = 1;
ind(1) = I;

B = changem(A,ind,unique(A(:,1:2)));
end


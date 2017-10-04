function [B] = graph_sampling(A,samples)
%creates sample graph from large input graph. The resulting graph is created from the random degree sequence of the original graph using graph_from_degree_sequence. Input in the form of edge
%list (nx2 or nx3). Output is the largest connected component of the
%resulting graph.
% Requires Matlab Tools For Network Analysis from MIT Strategic Engineering
% Research Group, available here: http://strategic.mit.edu/downloads.php?page=matlab_networks

A(:,3) = ones(size(A,1),1);
A=edgeL2adj(A);
A = directed_to_undirected(A);
[deg,~,~]=degrees(A);
seq = [];

while 1
    ids = randperm(size(A,1),samples);
    seq = deg(ids);
    if isgraphic(seq)
        break
    end
end

B = graph_from_degree_sequence(seq);
[B,~]=giant_component(B);
B = directed_to_undirected(B);
B = adj2edgeL(B);
end


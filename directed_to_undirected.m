function [B] = directed_to_undirected(A)
% transforms directed to undirected network. Input and output are adjacency
% matrices
    B = A + A';
    B(B>1)=1; 
end

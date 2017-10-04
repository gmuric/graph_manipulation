function [A] = adj_from_list(A1)
%creates an adjecency matrix from list of edges. Keeps the weights
%input: A1 is mx3
%output: A is an adjacency matrix mxm
[m,~] = size(A1);
A = zeros(max(A1(:)));
for i = 1:m
    A(A1(i,2),A1(i,1)) = A1(i,3);
end
A = A';
end
function [s] = dsc(A,b,k)
%Dynamic-Sensitive centrality from "Locating influential nodes via dynamic-sensitive centrality"
%s - DS centrality

%A - adjacency matrix
%b - probability of infection (in paper - beta)
%k - number of iterations
s = b*A;
for i = 1:k-1
    s = s+b^(i+1)*A^(i+1);
end
s = s*ones(size(A,1),1);
end
# Graph manipulation
## A set of functions for graph manipulation. Some of them are very specific and not for common tasks, but someone could find it very useful
- adj_from_list - Creates an adjecency matrix from the list of edges. Keeps the weights.
- adj_from_pred - Makes an adjacancy matrix from the list of predecessors.
- break_net - Keeps only the neighbourhood of the parent node. Discards the nodes and edges further than d steps away
- chose_distinct - Takes the array as input and returns the desired number of indices where unique elements appear
- chose_nodes - Randomizing choice from sorted array. Splits the array in n groups and picks m random nodes from each group
- directed_to_undirected - Transforms directed to an undirected network
- dsc - Dynamic-Sensitive centrality
- graph_sampling - creates sample graph from large input graph.  Extracts the random degree sequence and creates the graph using Havel-Hakimi algorithm
- hindex - H-index centrality
- make_acyclic - Creates an acyclic graph with the respect of a parent node using a specific algorithm

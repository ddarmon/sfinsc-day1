#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#
# This script imports the actor_net.graphml
# file and run some network analyses on it.
#
# 	DMD
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Uncomment v the first time you run, to install igraph:
install.packages('igraph')

# Import igraph functionality into R.
library(igraph)

# Load in the actor_net network.
network = read_graph("data/imdb/actor_net.graphML", format = 'graphml')

# Access the Vertices (i.e. nodes) and Edges (i.e. links) of the network.
V(network)
E(network)

# Plot the network with a given layout.
# Possible layouts include:
# layout_as_bipartite, layout_as_star, layout_as_tree, layout_in_circle,
# layout_nicely, layout_on_grid, layout_on_sphere, layout_randomly,
# layout_with_dh, layout_with_fr, layout_with_gem, layout_with_graphopt,
# layout_with_kk, layout_with_lgl, layout_with_mds, layout_with_sugiyama

# NOTE: igraph does not handle large networks very well.
# plot.igraph(network, label = NA, layout = layout_nicely)

# Compute and tabulate the degree sequence for the 
# network.
degree.out = degree(network)

table(degree.out)

# Plot the empirical cumulative distribution function
# (ecdf) of the degree sequence, and the table of 
# counts of the number of nodes with a given degree.
plot(ecdf(degree.out))
plot(table(degree.out))

# Compute the eigenvector centrality of each node in 
# the network.
eigen_centrality.out = eigen_centrality(network)

plot(eigen_centrality.out$vector, type = 'l')

# Note that the eigenvector centrality returned will
# not match Gephi's since igraph does not automatically
# handle the disconnected components.

# Compare to when we consider one of the connected components:

decompose.out = decompose(network)

length(decompose.out)

plot(eigen_centrality(decompose.out[[1]])$vector, type = 'l')

diameter.out = diameter(network)

# Plot some network embeddings, based on either the 
# adjacency matrix or graph laplacian.
embed.out = embed_adjacency_matrix(decompose.out[[1]], no = 2)
plot(embed.out$X)

embed.out = embed_laplacian_matrix(decompose.out[[1]], no = 2)
plot(embed.out$X)

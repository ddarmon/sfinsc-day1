# Uncomment v the first time you run, to install igraph:
install.packages('igraph')

library(igraph)

network = read_graph("data/imdb/actor_net.graphML", format = 'graphml')

V(network)
E(network)

# plot(network)

degree.out = degree(network)

table(degree.out)

plot(ecdf(degree.out))
plot(table(degree.out))

eigen_centrality.out = eigen_centrality(network)

plot(eigen_centrality.out$vector, type = 'l')

# Note that the eigenvector centrality is *not* 'correct' / 
# will not match Gephi's since igraph does not naturally
# handle the disconnected components.

# Compare to when we consider one of the connected components:

decompose.out = decompose(network)

length(decompose.out)

plot(eigen_centrality(decompose.out[[1]])$vector, type = 'l')

diameter.out = diameter(network)

embed.out = embed_adjacency_matrix(decompose.out[[1]], no = 2)
plot(embed.out$X)

embed.out = embed_laplacian_matrix(decompose.out[[1]], no = 2)
plot(embed.out$X)
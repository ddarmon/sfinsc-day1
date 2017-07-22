# Day 1 &mdash; Network Data Analysis

## Downloads

Before we get started, we need to install several applications for working with network data. Today, we will be using Sublime Text, Gephi, and R, along with a few of their packages.

[Sublime Text](https://www.sublimetext.com/) is a cross-platform text editor that provides flexible handling of large text files:

* [Sublime Text](https://www.sublimetext.com/)

We will be using [Gephi](https://gephi.org/) for network visualization:

* [Gephi](https://gephi.org/)

Gephi requires that the Java Runtime Environment (JRE). If the JRE is not already installed on your computer, download it here:

* [Java Runtime Environment](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)

For data analysis, we will be using R:

* [R](https://cran.cnr.berkeley.edu/)

A nice Integrated Development Environment (IDE) for R can be found here:

* [RStudio](https://www.rstudio.com/products/rstudio/download2/)  

## A 'Hello World' Network Analysis: Collaboration Networks from IMDB

For our first network, we will investigate co-acting networks generated using data from the [Internet Movie Database (IMDB)](http://www.imdb.com/). In our co-acting network, the nodes will correspond to actors, and an edge will exist between two nodes (actors) if the actors appeared in one or more movies together.

> **Exercise:** What sort of questions might we answer using co-acting network? About actors? About genres? About different eras of film?

## Data Cleaning

The data we will use originated [here](https://www.cise.ufl.edu/research/sparse/matrices/Pajek/IMDB.html). The entire data set consists of a [bipartite network](https://en.wikipedia.org/wiki/Bipartite_graph) of actors and movies, where actors are connected to movies if the actor appeared in the movie. This is a **bipartite** network because the network is partitioned into two types of nodes, actors and movies, and edges only exist between (but not within) the two types of nodes.

This network is very large: it consists of 428440 movies and 896308 actors. For a quick introduction to Gephi, we will consider a subset of the total network. First, we filter the set of movies to only those released in 1994 in the genre of science fiction. Then we further collapse the network via a [one-mode projection](https://en.wikipedia.org/wiki/Bipartite_network_projection) into the co-acting network we will study.

## Network Visualization and Exploratory Data Analysis with Gephi

Begin by opening the ``actor_net.graphml'' file in the data folder in Sublime Text. If your computer does not recognize the .graphml file extension, you may need to set the file to Open With Sublime Text. (Add details here.)

A snippet from the ``actor_net.graphml'' is below:

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/actor_net_sublimetext.png)

We see that the network is stored in XML format. GraphML is an XML-based network format, with a bit more sophistication than a simple edge list or adjacency matrix. Fortunately, Gephi supports GraphML, [among many other formats](https://gephi.org/users/supported-graph-formats/), so we can load the network into Gephi without knowing the ins-and-outs of the format.

Begin by opening Gephi. After the splash screen closes, you should see a prompt window. Choose New Project. This will lead to a blank Gephi project:

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/gephi-gui.png)

To load the network into Gephi, go to File > Open..., and navigate to folder where you saved the network. This should prompt the import report dialog box:

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/import-window.png)

This gives us some details about the network. By default, Gephi is treating the network as undirected, and assumes we have 2185 nodes and 40484 edges. Click OK to load the network into the current Workspace.

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/actor-start-network.png)

We now see the network in the Graph panel of the Overview perspective. If we click over to the Data Laboratory panel, we can see the network from ... (put more here)

Back in the Graph panel, we see that the network is more-or-less a 'hairball,' a term of art for the naive representation of a network with many nodes and edges. A good first starting point in Gephi is to attempt various different layouts of the network. Gephi has six or so non-trivial network layout algorithms. As a start, run the OpenOrd layout algorithm by choosing OpenOrd from the Layout dropdown menu and clicking Run. Click the magnifying glass in the bottom left corner of the Graph panel to reset the zoom to include the entire network.

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/network-after-openord.png)

That's better! We can already start to see a good amount of structure in the network. We see several disconnected components in the network.

> **Exercise:** Why do we see isolated clusters of actors?

Let's try running another network layout algorithm, this time the [Fruchterman-Reingold](https://github.com/gephi/gephi/wiki/Fruchterman-Reingold) algorithm. Choose Fruchterman Reingold from the dropdown menu and click Run.

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/network-after-fr.png)

Fruchterman-Reingold is a force-directed layout: that means it treats the the nodes as embedded in a (purely hypothetical!) physical system, where attraction / repulsion between nodes is determined by whether or not nodes are connected. See [here](http://citeseer.ist.psu.edu/viewdoc/download;jsessionid=19A8857540E8C9C26397650BBACD5311?doi=10.1.1.13.8444&rep=rep1&type=pdf) for more details. We see that after applying Fruchterman-Reingold, some of the clusters have 'relaxed.'

> **Pointer:** If you ever want to 'reset' the layout, you can run Random Layout, which randomly distributes the nodes of the network in a prescribed volume of space. Then you can run the desired layout algorithm 'from scratch.'

## Network Statistics with Gephi

Now that we have gotten a feeling for the macro-scale structure of the network, let's compute some of the network statistics we heard about in the talks earlier today. Gephi provides a suite of statistics in the right hand Statistics panel:

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/statistics-pane.png)

For example, click Run next to Average Degree to compute the degree distribution of the network:

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/degree-dist.png)

> **Exercise:** Does the degree distribution look like a 'power law'? How would you tell?

Gephi computes the in-degree and out-degree for each node in the network. After you compute a node-wise statistic, you can view that statistic for each node as a new column in the Data Laboratory panel:

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/data-laboratory-stats.png)

You can also use node statistics to update the appearance of the network in the Overview panel. To rescale the nodes according to their degree, choose the Node Size icon in the Appearance panel, select the Ranking option, and set the dropdown menu to degree. Change the Max Size option to 40, and click Apply.

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/nodes-resized.png)

To emphasize the nodes over the edges, reduce the width of the edges using the slider in the bottom next to the capital T.

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/nodes-resized-thin-edges.png)

We see that the node sizes (and thus node degrees) are relatively homogeneous within an isolated cluster (why?), but that several 'bridge' nodes have larger degrees relative to their neighbors in the network. Let's select one of these bridge nodes to investigate its identity. To do so, select the Node Investigation pointer in the left pane of the Graph panel, and click on one of the bridge nodes:

> **Tip:** To zoom in and out, use the scroll wheel on your mouse / the two finger swipe on your trackpad. On a Windows computer, use Right Click to drag. On a Mac, use Control-Click to drag.

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/shatner-node.png)

We see that the bridge node corresponds to William Shatner. He appeared in several sci-fi movies in 1994, amongst them [*Star Trek: Generations*](http://www.imdb.com/title/tt0111280/?ref_=nm_flmg_act_86).

> **Exercise:** Can you identify which cluster corresponds to the actors from *Star Trek: Generations*? To find Shatner's neighbors in the network, right click on his entry in the Data Laboratory and choose 'Select neighbour nodes on table'.

Degree is just one of many possible [node centralities](https://en.wikipedia.org/wiki/Centrality). A node has large degree centrality if it is connected to many other nodes in the network. Another form of node centrality is [eigenvector centrality](https://en.wikipedia.org/wiki/Centrality#Eigenvector_centrality). A node with high eigenvector centrality has a lot of connections to other nodes that also have many connections.

> **Exercise:** Compute the eigenvector centrality of the nodes in the network using the appropriate option in the Statistics panel. How do the eigenvector centralities compare to the degree centralities? Resize the nodes using the eigenvector centralities, and compare the nodes that stand out under each centrality.

## Network Analysis with igraph &mdash; Network Analysis in a Scripting Environment

Gephi is a great tool for visualizing and analyzing a network. If you are familiar with a scripting langauge (R, Python, Matlab, Octave, Julia, etc.), a great place to get started is with [igraph](http://igraph.org/r/). igraph provides a lot of the same functionality as Gephi, but in a scripting environment that makes automating network analysis a snap.

Let's use igraph to rerun some of the analyses we did in gephi with the IMDB network.

## Network Exploration with Additional Data Sets

To further hone your skills at Network Data Analysis and gephi, you can choose between two types of data sets: correlation networks for S&P 500 companies and a co-voting network from the US Senate.

### S&P 500 Correlation Networks

Start [here](https://github.com/ddarmon/sfinsc-day1/blob/master/sp500.md).

<!--
### Political Blogs

The original data are available [here](https://networkdata.ics.uci.edu/data.php?id=102).
-->

### US Senate Co-Voting Networks

Start [here](https://github.com/ddarmon/sfinsc-day1/blob/master/senate.md).
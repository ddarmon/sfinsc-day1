# Day 1 &mdash; Network Data Analysis

## Downloads

Before we get started, we need to install several applications for working with network data. Today, we will be using Sublime Text, Gephi, and R, along with a few of their packages.

[Sublime Text](https://www.sublimetext.com/) provides flexible handling of large text files:

* [Sublime Text](https://www.sublimetext.com/)

We will be using [Gephi](https://gephi.org/) for network visualization:

* [Gephi](https://gephi.org/)

Gephi requires that the Java Runtime Environment (JRE). If the JRE is not already installed on your computer, download it here:

* [Java Runtime Environment](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)

For data analysis, we will be using R:

* [R](https://cran.cnr.berkeley.edu/)

A nice Integrated Development Environment (IDE) for R can be found here:

* [RStudio](https://www.rstudio.com/products/rstudio/download2/)  

Finally, for additional network analysis tools, will use the igraph library for R. Installing new libraries into R is a little different than a usual software install. 

* [igraph](http://igraph.org/r/)  

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

Begin by opening Gephi. After the splash screen closes, you should see the main window for Gephi:

![Alt Text](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/gephi-gui.png)

## Network Statistics with Gephi

## Network Analysis with igraph

## The Data Sets

To explore Network Data Analysis and gephi, you will be working with two data sets: correlation networks for S&P 500 companies and a co-voting network from the US Senate.

### IMDB

The original data are available here.

### S&P 500 Correlation Networks

Start [here](https://github.com/ddarmon/sfinsc-day1/blob/master/sp500.md).

![Demo stock data](https://raw.githubusercontent.com/ddarmon/sfinsc-day1/master/graphics/stock-demo.png)

<!--
### Political Blogs

The original data are available [here](https://networkdata.ics.uci.edu/data.php?id=102).
-->

### US Senate Co-Voting Network

Start [here](https://github.com/ddarmon/sfinsc-day1/blob/master/senate.md).
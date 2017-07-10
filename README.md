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

## A `Hello World' Network Analysis: Collaboration Networks from IMDB

For our first network, we will investigate co-acting networks generated using data from the [Internet Movie Database (IMDB)](http://www.imdb.com/). In our co-acting network, the nodes will correspond to actors, and an edge will exist between two nodes (actors) if the actors appeared in one or more movies together.

## Data Cleaning

## Network Visualization and Exploratory Data Analysis with Gephi

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
# US Senate Co-Voting Networks

In this example, we will consider a network generated from the co-voting behavior of U.S. Senators over various Congresses. By considering the pairwise similarity in the voting records of senators, we can explore the political organization of the Senate and how it has changed over time.

## The Data

Roll call votes in the Senate and House are in the public record. You can find the official data from the Senate [here](https://www.senate.gov/reference/common/faq/how_to_votes.htm). We will be using data compiled by [Voteview](https://voteview.com/).

The original data are available [here](https://voteview.com/data). Each file corresponds to a particular Congress, and includes each 100 (+) Senator, their state, party affiliation, and other meta-data. For each roll call vote, a senator's vote is coded as 1 (yay), 6 (nay), 9 (abstention), or 0 (not in legislature).

## Network Construction

For each pair of senators, the edge weight is given by the probability that they voted the same during a given roll call vote. For example, if Senator A voted 1 6 1 6 1 and Senator B voted 1 1 6 6 1, then the edge between Senator A and Senator B has a weight of 3 / 5 = 0.6. 

The ``vote_similarity_###.edges`` files list each pair of senators and their probability of agreement on a roll call vote, where ``###`` corresponds to which Congress is under consideration. The ``vote_similarity_###.nodes`` files list the political party of each senator.

> **Exercise:** Open a few of the ``.edges`` and ``.nodes`` files in Sublime Text. Check that the edge weights seem to make sense, given what you know about how they were computed and the various senators.

> **Exercise:** Load in the node list and edge list files ``vote_similarity_114.nodes`` and ``vote_similarity_114.edges`` for the 114th Senate. Use File > Import spreadsheet... Be sure that ``Separator:`` is set to the proper delimiter and ``As table:`` is set to ``Edges table`` or ``Nodes table``, depending on which file you are importing.

The codes ``100``, ``200``, and ``328`` correspond to Democrats, Republicans, and Independents.

> **Exercise:** Color the nodes according to party affiliation. 

> **Exercise:** Try a few of the different layouts. Which ones show the clear separation between the two parties? Which do not? Why?

## Explorations

Begin by computing some of the network statistics from the co-voting network.

> **Exercise:** Use Statistics > Avg. Weighted Degree to compute the average weighted degree of each senator. What does a large degree mean? A small degree? Which senators have the largest and smallest degrees?

> **Exercise:** What other network statistics seem reasonable to compute using this network?

As constructed, the graph associated with this network is *complete*: there is an edge between each pair of senators because we have computed the voting similarity between each pair of senators. Thus, for 100 senators, we have 4950 edges. 

> **Exercise:** How do you determine the number of edges in an N node network? Hint: count the number of ways to pair each node with one of the other nodes, and account for duplicates from overcounting A -- B and B -- A.

We can learn more about the voting patterns of the senators by filtering the edges based on either strong or weak voting similarity.

> **Exercise:** Use Filters > Edges > Edge Weight to filter for edges with strong voting similarity. 

> **Exercise:** Try different thresholds of similarity for filtering the edges. Try running the Force Atlas 2 layout while changing the filter values for the edge weights. Based on the layout alone, can you identify 'outlier' senators based on their roll call voting behavior?

> **Exercise:** With the 114th Congress, use Filters > Edges > Edge Weight to filter for edges with strong voting *dis*similarity. What do you notice? What type of voting behavior do the 'hubs' in the filtered network correspond to?

> **Exercise:** Compute some of the network statistics. How do they change as a function of the filtering?

We often hear in the news that the political parties have become increasingly polarized in recent years. Our data set runs from the [102nd Congress](https://en.wikipedia.org/wiki/102nd_United_States_Congress) (in session from 1991-1992) to the [114th Congress](https://en.wikipedia.org/wiki/114th_United_States_Congress) (in session from 2015 - 2016).

> **Exercise:** Rerun the analyses above for additional Congresses using the additional ``vote_similarity_###.edges`` and ``vote_similarity_###.edges`` files. What sort of network statistics can you use to track polarization over time? Does your analysis corroborate the common wisdom that the political parties have become increasingly polarized? 

## Final Thoughts and Further Reading

This co-voting network, like the IMDB co-actor network, is really a projection of a bipartite network.

> **Exercise:** What are the two sets of objects in the associated bipartite network? What sort of information is lost by collapsing the bipartite network down to co-voting between senators?

For a more in-depth network analysis of committee assignment and voting behavior in the US House of Representatives, see [this paper](http://www.pnas.org/content/102/20/7057.full) by Mason Porter, Peter Mucha, Mark Newman, and Casey Warmbrand.
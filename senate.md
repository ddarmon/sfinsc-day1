# US Senate Co-Voting Networks

In this example, we will consider a network generated from the co-voting behavior of U.S. Senators over various Congresses. By considering the pairwise similarity in the voting records of senators, we can explore the political organization of the Senate and how it has changed over time.

## The Data

Roll call votes in the Senate and House are in the public record. You can find the official data from the Senate [here](https://www.senate.gov/reference/common/faq/how_to_votes.htm). We will be using data compiled by [Voteview](https://voteview.com/).

The original data are available [here](https://voteview.com/data). Each file corresponds to a particular Congress, and includes each 100 (+) Senator, their state, party affiliation, and other meta-data. For each roll call vote, a senator's vote is coded as 1 (yay), 6 (nay), 9 (abstention), or 0 (not in legislature).

## Network Construction

For each pair of senators, the edge weight is given by the probability that they voted the same during a given roll call vote. For example, if Senator A voted 1 6 1 6 1 and Senator B voted 1 1 6 6 1, then the edge between Senator A and Senator B has a weight of 3 / 5 = 0.6. 

The ``vote_similarity_###.edges`` files list each pair of senators and their probability of agreement on a roll call vote. The ``vote_similarity_###.nodes`` files list the political party of each senator.

> **Exercise:** Open a few of the ``.edges`` and ``.nodes`` files in Sublime Text. Check that the edge weights seem to make sense, given what you know about how they were computed and the various senators.

> **Exercise:** Load in the node list and edge list files ``vote_similarity_114.nodes`` and ``vote_similarity_114.edges`` for the 114th Senate.

The codes ``100``, ``200``, and ``328`` correspond to Democrats, Republicans, and Independents.

> **Exercise:** Color the nodes according to party affiliation. 

> **Exercise:** Try a few of the different layouts. Which ones show the clear separation between the two parties? Which do not? Why?

## Explorations

> **Exercise:** Use Statistics > Avg. Weighted Degree to compute the average weighted degree of each senator. What does a large degree mean? A small degree? Which senators have the largest and smallest degrees?

> **Exercise:** With the 114th Congress, use Filters > Edges > Edge Weight to filter for edges with strong voting similarity. Try different thresholds of similarity. Try running the Force Atlas 2 layout while changing the filter values for the edge weights.

> **Exercise:** With the 114th Congress, use Filters > Edges > Edge Weight to filter for edges with strong voting *dis*similarity. What do you notice? What type of voting behavior do the 'hubs' in the filtered network correspond to?

> **Exercise:** Compute some of the network statistics. How do they change as a function of the filtering?

## Final Thoughts and Further Reading

This co-voting network, like the IMDB co-actor network, is really a projection of a bipartite network.

> **Exercise:** What are the two sets of objects in the associated bipartite network? What sort of information is lost by collapsing the bipartite network down to co-voting between senators?

For a more in-depth network analysis of committee assignment and voting behavior in the US House of Representatives, see [this paper](http://www.pnas.org/content/102/20/7057.full) by Mason Porter, Peter Mucha, Mark Newman, and Casey Warmbrand.
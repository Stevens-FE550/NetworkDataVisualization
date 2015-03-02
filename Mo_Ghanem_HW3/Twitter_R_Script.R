#data analysis of twitter text 
library(igraph)
#setwd("~/Documents/Graduate School/Stevens Insistute of Technology/Courses/FE550-2015/HW2")
load("termDocMatrix.rdata")
#inspect part of the matrix
termDocMatrix[5:10,1:20]
#Change it to a Boolean Matrix
termDocMatrix[termDocMatrix.=1] <-1
#trandform into trem-term matrix
termMatrix <- termDocMatrix %*% t(termDocMatrix)
#inspect matrix
termMatrix[5:10,5:10]
#build a graph
g <- graph.adjacency(termMatrix,weighted=T, mode="undirected")
#remove Loops
g <- simplify(g)
#set labels and degrees of vertices
V(g)$label <- V(g)$name
V(g)$dgree <- degree(g)
set.seed(3952)
layout1 <- layout.fruchterman.reingold(g)
plot(g,layout=layout1)


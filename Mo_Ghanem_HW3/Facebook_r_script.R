# Facebook Network visualization by Mo Ghanem for FE550 HW3
# install devtools
#install.packages("devtools")
#install reshape Pachage
#install.packages("reshape")
#install.packages("reshape2")
# load devtools
#library(devtools)
# install arcdiagram
#install_github('arcdiagram', username = 'gastonstat')
# load arcdiagram
#library(arcdiagram)
library(igraph)
#load file
mofile <- read.graph("mognetwork.gml", format = c("gml"))


#get Gender, assign Shapes
vsex <- V(mofile)$sex
table (vsex)
vsex[vsex=="female"]  <-  "circle"
vsex[vsex=="male"]  <- "square"
table(vsex)

# get Names
vname <- V(mofile)$lable
table (vname)

# interface language, assigning colors
cloc  <- V(mofile)$locale
table(cloc)
cloc[cloc %in% c("ar_AR")]  <-  "Yellow"
cloc[cloc %in% c("es_ES","es_LA")]  <-  "Green"
cloc[cloc %in% c("en_GB", "fr_FR")]  <-  "red"
cloc[cloc==c("en_US")]  <-  "Blue"
table(cloc)

# wall posts count, assigning node size
nsize  <- (V(mofile)$wallcount/ max(V(mofile)$wallcount) + .1 )* 15

plot(mofile, layout=layout.fruchterman.reingold, edge.arrow.size=.5, vertex.label=NA, vertex.size=nsize, vertex.color=cloc)

# El primer paso consiste en abrir los datos
# desde RStudio. Aquí doy por asumido que 
# ya se sabe la manera de hacerlo.
library(ggplot2)
# Vamos a hacer nuestra primera Figura
ggplot(RegressionData, aes(x=RegressionData$`Received votes`, fill=RegressionData$Ideology)) + geom_density(alpha=0.3) + xlab("Received votes") + labs(fill="Ideology")
# Ahora vamos a guardarla como un objeto 
# que manipularemos con 
# una función para hacer que 
# aparezca tal como vemos en la Figura 1 
# del paper de Correa & Camargo (2017)
f1 <- ggplot(RegressionData, aes(x=RegressionData$`Received votes`, fill=RegressionData$Ideology)) + geom_density(alpha=0.3) + xlab("Received votes") + labs(fill="Ideology") + guides(fill=FALSE)
# Ahora vamos a generar las otras tres
# figuras que componen a la Figura 1
f2 <- ggplot(RegressionData, aes(x=RegressionData$`Number of tweets`, fill=RegressionData$Ideology)) + geom_density(alpha=0.3) + xlab("Number of tweets") + labs(fill="Ideology") + theme(legend.position="top")
f3 <- ggplot(RegressionData, aes(x=RegressionData$`Twitter followers`, fill=RegressionData$Ideology)) + geom_density(alpha=0.3) + xlab("Twitter followers") + labs(fill="Ideology") + guides(fill=FALSE)
f4 <- ggplot(RegressionData, aes(x=RegressionData$Retweets, fill=RegressionData$Ideology)) + geom_density(alpha=0.3) + xlab("Retweets") + labs(fill="Ideology") + guides(fill=FALSE)
# Vamos a crear una función llamada
# multiplot que nos permita colocar
# estas cuatro figuras exactamente
# como aparecen en el paper.
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
# 
plots <- c(list(...), plotlist)
  numPlots = length(plots)
  if (is.null(layout)) {
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  if (numPlots==1) {
    print(plots[[1]])
  } else {
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
# Pon la figura f1 al lado de la f2 en la parte superior
# y la f3 al lado de la f4 en la parte inferior 
multiplot(f1, f3, f2, f4, cols=2) 

# Ahora vamos a generar la figura 2 del paper
boxplot(LinguisticSimilarity$LinguisticSimilarity ~ LinguisticSimilarity$Comparison, xlab="Pairwise comparison of political ideologies")
# Finalmente vamos a generar la Figura 3 del paper
F1 <- ggplot(SimilarityMatrix3, aes(x=SimilarityMatrix3$Number.of.tweets, y=SimilarityMatrix3$Average.Retweets, colour=Ideology)) + geom_point() + geom_smooth(method = loess, se=FALSE) + theme(legend.position='none') + xlab("Number of tweets") + ylab("Average Retweets")
F2 <- ggplot(SimilarityMatrix3, aes(x=SimilarityMatrix3$Twitter.followers, y=SimilarityMatrix3$Average.Retweets, colour=Ideology)) + geom_point() + geom_smooth(method = loess, se=FALSE) + theme(legend.position='none') + xlab("Twitter followers") + ylab("Average Retweets")
F3 <- ggplot(SimilarityMatrix3, aes(x=SimilarityMatrix3$Received.votes, y=SimilarityMatrix3$Average.Retweets, colour=Ideology)) + geom_point() + geom_smooth(method = loess, se=FALSE) + theme(legend.position='none') + xlab("Received votes") + ylab("Average Retweets")
F4 <- ggplot(SimilarityMatrix3, aes(x=SimilarityMatrix3$Twitter.followers, y=SimilarityMatrix3$Number.of.tweets, colour=Ideology)) + geom_point() + geom_smooth(method = loess, se=FALSE) + theme(legend.position='none') + xlab("Twitter followers") + ylab("Number of tweets")
F5 <- ggplot(SimilarityMatrix3, aes(x=SimilarityMatrix3$Number.of.tweets, y=SimilarityMatrix3$Received.votes, colour=Ideology)) + geom_point() + geom_smooth(method = loess, se=FALSE) + theme(legend.position=c(0.15,0.8)) + xlab("Number of tweets") + ylab("Received votes")
F6 <- ggplot(SimilarityMatrix3, aes(x=SimilarityMatrix3$Twitter.followers, y=SimilarityMatrix3$Received.votes, colour=Ideology)) + geom_point() + geom_smooth(method = loess, se=FALSE) + theme(legend.position='none') + xlab("Twitter followers") + ylab("Received votes")

multiplot(F1, F2, F3, F4, F5, F6, cols=3) 
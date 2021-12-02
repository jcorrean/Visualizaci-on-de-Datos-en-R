library(twitteR)
consumerKey <- "sXw2U0g2NjprKWqJnW7Smt3iR"
consumerSecret <- "ONzRnrmc7BVHbakKBcXBHmIP1LxcGmkyKfsTaT53GCVR1iswX3"
accessToken <- "106483037-636HLJ1Uq1iA4XBtXijkgt2laX3Uoy6oEactvogs"
accessTokenSecret <- "LSDvtQ3GvomVI0weUrrhjMpACpvVGqGxomFkFpK5YFXW2"

setup_twitter_oauth(consumerKey, consumerSecret, accessToken,
                    accessTokenSecret)
2

tweets = searchTwitter("@PachoSantosC", n = 1000)
tweet2 = searchTwitter("@CaracolRadio", n = 1000)
tweet3 = searchTwitter("@", n = 1000)
library(plyr)
tweets.df = ldply(tweets, function(t) t$toDataFrame())
tweets.df2 = ldply(tweet2, function(t) t$toDataFrame())

todas = rbind(tweets.df, tweets.df2)

library(twitteR)
consumerKey <- "coLoCar AquI La CrEdenCial"
consumerSecret <- "coLoCar AquI La CrEdenCial"
accessToken <- "coLoCar AquI La CrEdenCial"
accessTokenSecret <- "coLoCar AquI La CrEdenCial"

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

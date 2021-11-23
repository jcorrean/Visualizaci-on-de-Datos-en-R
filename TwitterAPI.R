library(twitteR)
consumerKey <- "wXvqi1I8hNmTsXLttgXupiRQ2"
consumerSecret <- "ZAKnxv2ZNmfoIh4l3GsRg1MH1aGzsm23E8Kmb8Nkm8PXzyCUg7"
accessToken <- "106483037-xXczaEith1UuawtlbJt8zQ1M5I61sKhaKkJZQs5W"
accessTokenSecret <- "tfDXjQMLzJ20pzhc2e35FOzIbvVFt4TA3GR60fZpgKdNu"

setup_twitter_oauth(consumerKey, consumerSecret, accessToken,
                    accessTokenSecret)
2

tweets = searchTwitter("@PachoSantosC", n = 1000)
library(plyr)
tweets.df = ldply(tweets, function(t) t$toDataFrame())

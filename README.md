# Twit bot from TXT file

Tweet books into chunked twits.

Examples:

- https://twitter.com/1984In5kTweets


# Development and use

You can run the script using:
```
ruby lib/app.rb --consumer_key=TWITTER_CONSUMER_LEY --consumer_secret=TWITTER_CONSUMER_SECRET --access_token=TWITTER_ACCESS_TOKEN --access_token_secret=TWITTER_ACCESS_TOKEN_SECRET -i INITIAL_TIMESTAMP --book BOOK_PATH
```

Run instance
```
docker build -t ruby .
```

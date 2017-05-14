require 'twitter'

class TwitterUtils
  attr_accessor :rest_client, :streaming_client

  def initialize
    @rest_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def streaming_client
    @streaming_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def fetch_mentions(account)
    results = []
    sentiment_analyzer = SentimentUtils.new

    tweets = rest_client.search("to:#{account.uid}", result_type: 'recent')
    tweets.collect do |tweet|
      sentiment = sentiment_analyzer.find_sentiment_score(tweet.text)
      results << { account_id: account.id,
        uid: tweet.id.to_s,
        author: tweet.user.screen_name,
        title: '',
        description: tweet.text,
        created_at: tweet.created_at,
        sentiment: sentiment
      }
    end
    results
  end

  def app_info(account)
    twitter_user = rest_client.user(account.uid)
    { name: twitter_user.name, display_picture_url: twitter_user.profile_image_uri_https.to_s }
  end
end


namespace :twitter do
  desc "random_tweet" #description
  task :tweet => :environment do
    twitter_client
    @tweet = Picture.order('random()').first
    status = ''
    media = open(@tweet.picture.to_s)
    @client.update_with_media(status, media)
  end
end

def twitter_client
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end
end

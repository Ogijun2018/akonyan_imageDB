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
    config.consumer_key = "CALKHtZC8RoWopmp2arTBLgt0"
    config.consumer_secret = "lGNBFr8PqYSyZwbLm7aRgNqPJbfiLEOmK9tn4ChySJnr7slJw7"
    config.access_token = "1306064281268449280-0t3d1yvFPqtv3iFHQ3kE5lKZZtmklS"
    config.access_token_secret = "SiYJlnSSIsZBo2tlML6wFaLKhim8TFyya9oRuJ4dS19rC"
  end
end

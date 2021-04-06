class PicturesController < ApplicationController
  before_action :twitter_client, except: :new
  PER = 5
  def index
    @pictures = Picture.order(created_at: :desc).page(params[:page]).per(PER)
  end

  def post
    require 'open-uri'
    @tweet = Picture.order('random()').first
    status = ''
    # to_sで文字列に変換
    media = open(@tweet.picture.to_s)
    @client.update_with_media(status, media)
    redirect_to :root
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params) # put into the data from form
    @picture.save
    # redirect_to root_path
  end

  def show
  end

  def update
  end

  def destroy
    @picture = Picture.find_by(id: params[:id])
    @picture.destroy
    redirect_to root_path
  end

  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "CALKHtZC8RoWopmp2arTBLgt0"
      config.consumer_secret = "lGNBFr8PqYSyZwbLm7aRgNqPJbfiLEOmK9tn4ChySJnr7slJw7"
      config.access_token = "1306064281268449280-0t3d1yvFPqtv3iFHQ3kE5lKZZtmklS"
      config.access_token_secret = "SiYJlnSSIsZBo2tlML6wFaLKhim8TFyya9oRuJ4dS19rC"
    end
  end

  private 
    def picture_params
      params.require(:picture).permit(:picture)
    end
end

class PicturesController < ApplicationController
  before_action :twitter_client, except: :new
  before_action :logged_in_user, only:[:new, :destroy]
  PER = 6
  def index
    @pictures = Picture.order(created_at: :desc).page(params[:page]).per(PER)
  end

  def post
    require 'open-uri'
    @tweet = Picture.order('random()').first
    status = ''
    # to_sで文字列に変換
    media = URI.open(@tweet.picture.to_s)
    @client.update_with_media(status, media)
    redirect_to :root
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params) # put into the data from form
    @picture.save
    redirect_to new_picture_path
    # redirect_to root_path
  end

  def show
    @picture = Picture.find_by(id: params[:id])
    impressionist(@picture, nil, unique: [:ip_address])
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
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  private 
    def picture_params
      params.require(:picture).permit(:picture)
    end
end

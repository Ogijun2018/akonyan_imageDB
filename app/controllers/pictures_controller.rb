class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params) # put into the data from form
    @picture.save
    redirect_to root_path
  end

  def show
  end

  def update
  end

  private 
    def picture_params
      params.require(:picture).permit(:episode, :serif, :picture)
    end
end

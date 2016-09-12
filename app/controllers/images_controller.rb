class ImagesController < ApplicationController
  before filter :admin_only

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
    else
    end
  end


private

  def image_params
    params.require(:image).permit(:name, :url)
  end
end

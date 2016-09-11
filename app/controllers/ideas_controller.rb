class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to ideas_path
    else
    end
  end

private

  def idea_params
    params.require(:idea).permit(:name, :description)
  end

end

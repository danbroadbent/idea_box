class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to ideas_path
    else
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
  end

  def destroy
  end

private

  def idea_params
    params.require(:idea).permit(:name, :description)
  end

end

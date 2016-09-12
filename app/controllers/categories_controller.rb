class CatergoriesController < ApplicationController
  before filter :admin_only

def index
  @categories = Category.all
end

def new
  @category = Category.new
end

def create
  @category = Category.new(category_params)
  if @category.save
    redirect_to categories_path
  else
  end
end

def destroy
  @category = Category.find(params[:id])
  @category.delete
  redirect_to categories_path
end

private

def category_params
  params.require(:category).permit(:name)
end

end

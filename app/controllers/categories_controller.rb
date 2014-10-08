class CategoriesController < ApplicationController

  before_action :require_user, except: [:index, :show]

def index
  @categories = Category.all
end

def show
  @category = Category.find(params[:id])
end

def new
  @category = Category.new
end

def create
   # binding.pry
  @category = Category.new(category_params)

  if @category.save
    flash[:message] = 'Category Saved'
    redirect_to categories_path
  else
    render :new
  end
end

def edit
  @category = Category.find(params[:id])
end

def update
  @category = Category.find(params[:id])
  
  if @category.update(category_params)
    flash[:message] = 'Category Updated'
    redirect_to categories_path
  else
    render :edit
  end


end

def destroy
end

def category_params
    # params.require(:post).permit(:title, :url, :description)
    params.require(:category).permit! #permits all
  end

end
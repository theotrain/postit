class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_admin, except: [:index, :show]

def index
  @categories = Category.all
end

def show
  
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
  
end

def update
   
  if @category.update(category_params)
    flash[:message] = 'Category Updated'
    redirect_to categories_path
  else
    render :edit
  end
end

def destroy
end

def set_category
  @category = Category.find_by(slug: params[:id])
end

def category_params
    # params.require(:post).permit(:title, :url, :description)
    params.require(:category).permit! #permits all
  end

end
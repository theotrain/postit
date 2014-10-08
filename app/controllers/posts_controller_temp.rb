class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  # before action used to
  # 1) set up instance variables
  # 2) redirect based on some condition (ex: not logged in)

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    # binding.pry

    @post = Post.new(post_params)

    if @post.save
      # redirect on save
      flash[:notice] = "your post was created"
      redirect_to posts_path
    else
      # render on validation error
      # because we need to keep the @post.errors in memory
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "post was updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def post_params
    # params.require(:post).permit(:title, :url, :description)
    params.require(:post).permit! #permits all
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

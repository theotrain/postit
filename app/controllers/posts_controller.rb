class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:index, :show]
  # before action used to
  # 1) set up instance variables
  # 2) redirect based on some condition (ex: not logged in)

  def index
    @posts = Post.all.sort_by{|x| x.total_votes}.reverse
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry

    @post = Post.new(post_params)
    @post.creator = current_user
    if @post.save
      flash[:message] = "Your post was saved!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:message] = "The post was updated!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def vote
    # binding.pry
    @vote = Vote.create(creator: current_user, vote: params[:vote], voteable: @post)
    
    respond_to do |format|
      format.html do 
        if @vote.valid?
          flash[:notice] = 'Thanks for voting!'
        else
          flash[:error] = "Sorry, we couldn't count your vote."
        end
        redirect_to :back
      end
      format.js { }
    end
  end

  def post_params
    # params.require(:post).permit(:title, :url, :description)
    params.require(:post).permit! #permits all
    # params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    # //binding.pry
    @post = Post.find_by(slug: params[:id])
  end
end

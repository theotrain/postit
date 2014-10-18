class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find_by(slug: params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      flash[:message] = "Your comment was added"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    # binding.pry
    @comment = Comment.find(params[:id])
    @vote = Vote.create(creator: current_user, voteable: @comment, vote: params[:vote])
    
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


end

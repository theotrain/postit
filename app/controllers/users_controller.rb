class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You are registered and logged in as '#{params[:user][:username]}'."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @user.update(user_params)
      flash[:notice] = "Profile has been updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show

  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
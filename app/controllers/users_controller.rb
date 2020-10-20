class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def update
    @user = User.find(
    params[:user_id]
    )

    if current_user.confirm_friend(@user)
      redirect_to users_path, notice: 'Invite accepted!'
    else
      redirect_to users_path, alert: 'Something went wrong, please try again!'
    end
  end

  def destroy
    @user = User.find(
    params[:user_id]
    )

    if current_user.reject_friend(@user)
      redirect_to users_path, notice: 'Canceling Succeed!'
    else
      redirect_to users_path, alert: 'Something went wrong, please try again!'
    end
  end
end

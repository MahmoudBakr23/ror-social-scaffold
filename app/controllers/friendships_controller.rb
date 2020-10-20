class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:user_id], confirmed: false)

    if @friendship.save
      redirect_to users_path, notice: 'Invitation sent!'
    else
      redirect_to users_path, alert: 'Something went wrong, please try again!'
    end
  end
end

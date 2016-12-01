class UsersController < ApplicationController
  # skip_before_action :authenticate_user, only: [:create]

  def create
    byebug
    email = user_data.email
  end

  def update

  end

  def show(user_id)
    @user = User.find(user_id)
    render json: @user
  end



end

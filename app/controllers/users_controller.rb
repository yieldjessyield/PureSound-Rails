class UsersController < ApplicationController

  def create(user_data)
    email = user_data.email
  end

  def update

  end

  def show(user_id)
    @user = User.find(user_id)
    render json: @user
  end



end

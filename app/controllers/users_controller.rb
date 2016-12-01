class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    user = User.new(user_params)

    if user.save
     jwt = Auth.issue({user_id: user.id})
     email = user.email
     password = user.password
     phone_number = user.phone_number
     render json: {jwt: jwt, userEmail: email, userPhoneNumber: phone_number}

   else
     render json: {error: 'email is not unique'}
   end
  end

  def update

  end

  def show(user_id)
    @user = User.find(user_id)
    render json: @user
  end

private

  def user_params
    # this is strong params
    params.require(:user).permit(:email, :password, :phone_number)
    # changed :user from :auth
  end


end



















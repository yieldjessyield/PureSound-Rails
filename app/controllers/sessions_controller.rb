class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create, :show]

  def create
    user = User.find_by(email: user_params['email'])

    if user && user.authenticate(user_params['password'])

      jwt = Auth.issue({user_id: user.id})
      render json: {jwt: jwt, userEmail: user.email, userPhoneNumber: user.phone_number}
    else
      render json: {error: "Really tho, nah"}
    end

  end


  def destroy
    session[:user_id] = nil
  end

  private

  def user_params
    # this is strong params
    params.require(:user).permit(:email, :password, :phone_number)
    # changed :user from :auth
  end

end

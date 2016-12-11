class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create, :show]
  # validates :email, :confirmation => true
  # validates :email, :presence => true
  # validates :email, uniqueness: true
  # validates :password, :presence => true
  # validates :phone_number, :presence => true

  def create
    # byebug
    user = User.new(user_params)

    if user.save

      jwt = Auth.issue({user_id: user.id})
      email = user.email
      phone_number = user.phone_number
      id = user.id
      render json: {jwt: jwt, userId: id, userEmail: email, userPhoneNumber: phone_number}

   else
     render json: {error: 'email is not unique'}
   end
  end


  def update
    user = User.find(current_user.id)
    if user_params["password"] == nil
      # user.update(attributes)
      user.update(email: user_params["email"], phone_number: user_params["phone_number"])
      # user.update()
      # user.save
    else
      user.update(user_params)
      # user.update(email: user_params["email"])
      # user.update(password_digest: user_params["password_digest"])
      # user.update(phone_number: user_params["phone_number"])
    end
      jwt = Auth.issue({user_id: user.id})
      email = user.email
      phone_number = user.phone_number
      id = user.id
      render json: {jwt: jwt, userId: id, userEmail: email, userPhoneNumber: phone_number}

  end

  def show

  end

  private

  def user_params
    # this is strong params
    params.require(:user).permit(:email, :password, :phone_number, :artists)
    # changed :user from :auth
  end


end

class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params)
    if @user
      login!(@user)
      render json: @user
    else
      render json: @user.errors.full_messages,
                   status: :unprocessable_entity
    end
  end

  def destroy
    logout!
    redirect_to :root
  end
end

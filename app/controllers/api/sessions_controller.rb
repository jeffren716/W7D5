class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user.nil?
      render json: { status: "error", code: 404, message: "Invalid username or password"}
    else
      login!(@user)
      render :show
    end
  end

  def destroy
    logout!
    
  end
end

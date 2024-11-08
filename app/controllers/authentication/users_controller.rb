class Authentication::UsersController < ApplicationController

  skip_before_action :protect_pages

  def new
    @user = User.new
  end

  def  create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path, alert: "Invalid email, username or password."
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
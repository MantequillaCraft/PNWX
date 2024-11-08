class ApplicationController < ActionController::Base

  before_action :set_current_user
  before_action :protect_pages, except: [:home]

  def home
  end

  private

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def protect_pages
    unless Current.user 
      redirect_to new_user_path
    end
  end
  
  
end

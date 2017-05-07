class HomeController < ApplicationController
  before_action:require_login
  
  def index
  end
  def friends
      @user=current_user
      @user.save
  end
  def write
      @user=current_user
      @user.background_img=params[:background_img]
      @user.save
      redirect_to "/home/index"
  end
  
  def board
  end
end

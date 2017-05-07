class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def friends
    @user = current_user
  end
  def board
  end
  def change_profile_img
    @user = current_user
    @user.profile_img = params[:img]
    @user.save
    redirect_to '/home/friends'
  end
  def change_background_img
    @user = current_user
    @user.background_img = params[:img]
    @user.save
    redirect_to '/home/friends'
  end
end

class HomeController < ApplicationController

  before_action :authenticate_user!
  def index
  end
  
  def friends
    @alluser=User.all
    @allfriend=UserFriend.all
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

  # modal category, title, 
  def write_post
    category_array = ["아침", "점심", "저녁"]
    category_param = params[:category].to_i
    
    @post = Post.new(title: category_array[category_param], content: params[:content], 
                      user_email: current_user.email, category: category_param, calorie: 1000)
    
    @post.image = params[:pic]
    @post.save!
    redirect_to '/'
  end

  def make_friend
    @friend=UserFriend.find(params[:friend_id])
    @friend.status=1
    @friend.save
    redirect_to '/home/friends'
  end
  def do_friend
      @user=current_user
      @touser=User.find_by(email:params[:find_friend])
      if @touser==nil
            redirect_to '/home/index'
      end
  end

end

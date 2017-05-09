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
      
       @first=UserFriend.where(user_email:@touser.email)   
       unless @first==nil
         @relation=@first.find_by(friend_email:@user.email)
         if @relation==nil
           @first=UserFriend.where(user_email:@user.email)
             if @first==nil
               @relation=UserFriend.new(user_email:@user.email,friend_email:@touser,status:2)
             else
               @relation=@first.find_by(friend_email:@touser.email) 
               if @relation==nil
                  @relation=UserFriend.new(user_email:@user.email,friend_email:@touser,status:2)
               end
             end
         end
         @relation.save
       else
         @first=UserFriend.where(user_email:@user.email)
          if @first==nil
             @relation=UserFriend.new(user_email:@user.email,friend_email:@touser,status:2) 
          else 
             @relation=@first.find_by(friend_email:@touser.email)
             if @relation==nil
                @relation=UserFriend.new(user_email:@user.email,friend_email:@touser,status:2)
             end
          end
          @relation.save
       end
      
  end
  def make_friend2
      @touser=User.find(params[:touser_id])
      @user=User.find(params[:user_id])
      @friend=UserFriend.where(user_email:@touser.email)
      @made=@friend.find_by(friend_email:@user.email)
      @made.status=1
      @made.save
      redirect_to '/home/friends'
  end
  def bemyfr
      @user=User.find(params[:user_id])
      @touser=User.find(params[:touser_id])
      @relation=UserFriend.new(user_email:@user.email,friend:@touser.email,status:0)
      @relation.save
      
      redirect_to '/home/friends'
  end

end

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
      @allfriend=UserFriend.all
      @alluser=User.all
      if @touser==nil
          redirect_to :back
      else
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
      
      
      @touser_friend_1=UserFriend.where(user_email:@touser.email)
      @touser_friend_2=UserFriend.where(friend_email:@touser.email)
      @sejong=UserFriend.where(user_email:@user.email)
      @daewang=UserFriend.where(friend_email:@user.email)
      if @sejong==nil&&@daewang==nil 
          @touser_friend_1.each do |to1|
          @edo=UserFriend.new(user_email:@user.email,friend_email:to1.friend_email,status:2)
          end
          @touser_friend_2.each do |to2|
          @edo=UserFriend.new(user_email:@user.email,friend_email:to2.user_email,status:2)
          @edo.save
          end  
      else
          if @touser_friend_1!=nil && @touser_friend_2!=nil
            if @touser_friend_1.length >= @touser_friend_2.length
                @touser_friend_1.each do |to1|
                    if to1.friend_email!=@user.email
                      if @sejong!=nil && @daewang!=nil 
                         @temp=@sejong.find_by(friend_email:to1.friend_email)
                         if @temp==nil
                              @add=@daewang.find_by(user_email:to1.friend_email)
                              if @add==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to1.friend_email,status:2)
                                @edo.save
                              end
                         end
                         @temp2=@daewang.find_by(user_email:to1.friend_email)
                           if @temp2==nil
                             @add2=@sejong.find_by(friend_email:to1.friend_email)
                             if @add2==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to1.friend_email,status:2)
                                @edo.save
                             end
                           end 
                      else  
                          if @sejong==nil
                            @temp=@daewang.find_by(user_email:to1.friend_email)
                            if @temp==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to1.friend_email,status:2)
                                @edo.save
                            end
                          else
                            @temp=@sejong.find_by(friend_email:to1.friend_email)
                            if @temp==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to1.friend_email, status:2)
                                @edo.save
                            end
                          end
                      end  
                    end  
                end
            else
                @touser_friend_2.each do |to2|
                    if to2.user_email!=@user.email
                      if @sejong!=nil && @daewang!=nil 
                         @temp=@sejong.find_by(friend_email:to2.user_email)
                         if @temp==nil
                              @add=@daewang.find_by(user_email:to2.user_email)
                              if @add==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to2.user_email,status:2)
                                @edo.save
                              end
                         end
                         @temp2=@daewang.find_by(user_email:to2.user_email)
                           if @temp2==nil
                             @add2=@sejong.find_by(friend_email:to2.user_email)
                             if @add2==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to2.user_email,status:2)
                                @edo.save
                             end
                           end 
                      else  
                          if @sejong==nil
                            @temp=@daewang.find_by(user_email:to2.user_email)
                            if @temp==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to2.user_email,status:2)
                                @edo.save
                            end
                          else
                            @temp=@sejong.find_by(friend_email:to2.user_email)
                            if @temp==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to2.user_email, status:2)
                                @edo.save
                            end
                          end
                      end  
                    end  
                end
            end
          else
            if @touser_friend_2==nil
              @touser_friend_1.each do |to1|
                    if to1.friend_email!=@user.email
                      if @sejong!=nil && @daewang!=nil 
                         @temp=@sejong.find_by(friend_email:to1.friend_email)
                         if @temp==nil
                              @add=@daewang.find_by(user_email:to1.friend_email)
                              if @add==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to1.friend_email,status:2)
                                @edo.save
                              end
                         end
                         @temp2=@daewang.find_by(user_email:to1.friend_email)
                           if @temp2==nil
                             @add2=@sejong.find_by(friend_email:to1.friend_email)
                             if @add2==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to1.friend_email,status:2)
                                @edo.save
                             end
                           end 
                      else  
                          if @sejong==nil
                            @temp=@daewang.find_by(user_email:to1.friend_email)
                            if @temp==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to1.friend_email,status:2)
                                @edo.save
                            end
                          else
                            @temp=@sejong.find_by(friend_email:to1.friend_email)
                            if @temp==nil
                                @edo=UserFriend.new(user_email:@user.email, friend_email:to1.friend_email, status:2)
                                @edo.save
                            end
                          end
                      end  
                    end
               end
            end
            if @touser_friend_1==nil
                  @touser_friend_2.each do |to2|
                       if to2.user_email!=@user.email
                          if @sejong!=nil && @daewang!=nil 
                             @temp=@sejong.find_by(friend_email:to2.user_email)
                             if @temp==nil
                                  @add=@daewang.find_by(user_email:to2.user_email)
                                  if @add==nil
                                    @edo=UserFriend.new(user_email:@user.email, friend_email:to2.user_email,status:2)
                                    @edo.save
                                  end
                             end
                             @temp2=@daewang.find_by(user_email:to2.user_email)
                               if @temp2==nil
                                 @add2=@sejong.find_by(friend_email:to2.user_email)
                                 if @add2==nil
                                    @edo=UserFriend.new(user_email:@user.email, friend_email:to2.user_email,status:2)
                                    @edo.save
                                 end
                               end 
                          else  
                              if @sejong==nil
                                @temp=@daewang.find_by(user_email:to2.user_email)
                                if @temp==nil
                                    @edo=UserFriend.new(user_email:@user.email, friend_email:to2.user_email,status:2)
                                    @edo.save
                                end
                              else
                                @temp=@sejong.find_by(friend_email:to2.user_email)
                                if @temp==nil
                                    @edo=UserFriend.new(user_email:@user.email, friend_email:to2.user_email, status:2)
                                    @edo.save
                                end
                              end
                          end  
                       end  
                  end
            end
          end  
                
      end
      end
  end
  
  def make_friend2
      @touser=User.find(params[:touser_id])
      @user=User.find(params[:user_id])
      @friend=UserFriend.where(user_email:@touser.email)
      @made=@friend.find_by(friend_email:@user.email)
      @made.status=1
      @made.save
      redirect_to :back
  end
  def bemyfr
      @user=User.find(params[:user_id])
      @touser=User.find(params[:touser_id])
      @temp=UserFriend.where(user_email:@user.email)
      @relation=@temp.find_by(friend_email:@touser.email)
      @relation.status=1
      @relation.save
      
      redirect_to :back
  end
  def bemyfr2
      @user=User.find(params[:user_id])
      @touser=User.find(params[:touser_id])
      @temp=UserFriend.where(user_email:@user.email)
      @relation=@temp.find_by(friend_email:@touser.email)
      @relation.status=0
      @relation.save
      
      redirect_to :back
  end
  def bemyfr3
      @user=User.find(params[:user_id])
      @touser=User.find(params[:touser_id])
      @temp=UserFriend.where(user_email:@touser.email)
      @relation=@temp.find_by(friend_email:@user.email)
      @relation.status=0
      @relation.save
      
      redirect_to :back
  end

end

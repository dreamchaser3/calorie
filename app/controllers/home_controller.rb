class HomeController < ApplicationController

  before_action :authenticate_user!
 
  def profile
    @user=current_user
    @user.username=params[:c_name]
    @user.password=params[:c_password]
    @user.profile_img=params[:c_profile]
    @user.background_img=params[:c_background]
    @user.save
    redirect_to :back
  end
  
  def reset_image_url
    @p = Post.last
    @p.output_url = params[:output_url]
    
    classes = params[:classes]
    
    classes.each do |c|
      food = Food.find(c)
      @p.foods.push(food)
      @p.calorie += food.calorie
    end 
    @p.save
    redirect_to '/'
  end
  def index
    @posts = Post.where(:user_email => current_user.email).group_by {|c| c.created_at.to_date}
    @breakfast= nil
    @lunch = nil
    @dinner = nil
    
    @test1 = "2017-04-23"
    @test2 = 100
    
    @data = Hash.new
    
    @posts.keys.each do |k|
      calories = []
      @posts[k].each do |p|
        date = p.created_at.strftime("%Y-%m-%d")
        calories[p.category] = p.calorie
        @data[date] = calories
      end
    end
    @data_keys = @data.keys
    
    @results = []
    @data_keys.each do |k|
      a = {}
      a['date'] = k
      a['breakfast'] = @data[k][0]
      a['lunch'] = @data[k][1]
      a['dinner'] = @data[k][2]
      @results.push(a)
    end
    if !@posts[Time.zone.now.to_date].nil?
      @posts[Time.zone.now.to_date].each do |p|
        if p.category == 0
          @breakfast = p
        elsif p.category == 1
          @lunch = p
        else
          @dinner = p
        end
      end
    end
  end
  
  def friends
    @alluser=User.all
    @allfriend=UserFriend.all
    @user = current_user
  end
  
  def board
    @u = current_user
    @user = User.find(params[:id].to_i)
    Post.where(:user_email => @user.email).each do |p|
      Reply.where(:post_id => p.id).each do |r|
        r.status = 0
        r.save
      end  
    end
    
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
  
  def write_post
    category_array = ["아침", "점심", "저녁"]
    category_param = params[:category].to_i
    @post = Post.new(title: category_array[category_param], content: params[:content], 
                      user_email: current_user.email, category: category_param, calorie: 0)
    
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
        unless @user==@touser
           @first=UserFriend.where(user_email:@touser.email)   
           unless @first==nil
             @relation=@first.find_by(friend_email:@user.email)
             if @relation==nil
               @first=UserFriend.where(user_email:@user.email)
                 if @first==nil
                   @relation=UserFriend.new(user_email:@user.email,friend_email:@touser.email,status:2)
                 else
                   @relation=@first.find_by(friend_email:@touser.email) 
                   if @relation==nil
                      @relation=UserFriend.new(user_email:@user.email,friend_email:@touser.email,status:2)
                   end
                 end
             end
             @relation.save
           else
             @first=UserFriend.where(user_email:@user.email)
              if @first==nil
                 @relation=UserFriend.new(user_email:@user.email,friend_email:@touser.email,status:2) 
              else 
                 @relation=@first.find_by(friend_email:@touser.email)
                 if @relation==nil
                    @relation=UserFriend.new(user_email:@user.email,friend_email:@touser.email,status:2)
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
      @relation.status=0
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

  def write_reply
    @reply = Reply.new(content: params[:content], post_id: params[:id], user_email: params[:user_email], status: params[:status])
        if @reply.save
            redirect_to :back
        else
            alert("error")
        end
  end
end

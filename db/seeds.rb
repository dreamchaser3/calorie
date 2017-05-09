# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email:'wondangjk@naver.com',password:"123456",username:"박세환",background_img:"http://blogfiles5.naver.net/20131221_38/hosungkwang_1387622849957N4OVg_JPEG/tumblr_lpi0w6LNDU1qkblnro1_500.jpg",
            profile_img:"http://cafefiles.naver.net/20100811_59/qlcsk9106_1281528614869sl0z6_jpg/cy-01063607984_ed98b8ec95bc_5_qlcsk9106.jpg")
User.create(email:'dreamchaser3@naver.com',password:"123456",username:"서유정",background_img:"http://cafefiles.naver.net/20130501_85/hiyo_o__13674100081975IVsD_JPEG/-1568620571.jpg",
            profile_img:"http://cafefiles.naver.net/20110812_96/imagine0331_13131321541223AeYL_jpg/fave_21_imagine0331.jpg")         
User.create(email:'kimhyunwoo@naver.com',password:"123456",username:"김현우",background_img:"http://cafefiles.naver.net/20130501_85/hiyo_o__13674100081975IVsD_JPEG/-1568620571.jpg",
            profile_img:"http://cafefiles.naver.net/20110812_96/imagine0331_13131321541223AeYL_jpg/fave_21_imagine0331.jpg")        
User.create(email:'ohhyunju@naver.com',password:"123456",username:"오현주",background_img:"http://cafefiles.naver.net/20130501_85/hiyo_o__13674100081975IVsD_JPEG/-1568620571.jpg",
            profile_img:"http://cafefiles.naver.net/20110812_96/imagine0331_13131321541223AeYL_jpg/fave_21_imagine0331.jpg")
User.create(email:'test@naver.com',password:"123456",username:"테스트",background_img:"http://cafefiles.naver.net/20130501_85/hiyo_o__13674100081975IVsD_JPEG/-1568620571.jpg",
            profile_img:"http://cafefiles.naver.net/20110812_96/imagine0331_13131321541223AeYL_jpg/fave_21_imagine0331.jpg")
User.create(email:'test2@naver.com',password:"123456",username:"테스트2",background_img:"http://cafefiles.naver.net/20130501_85/hiyo_o__13674100081975IVsD_JPEG/-1568620571.jpg",
            profile_img:"http://cafefiles.naver.net/20110812_96/imagine0331_13131321541223AeYL_jpg/fave_21_imagine0331.jpg")
UserFriend.create(user_email:'wondangjk@naver.com',friend_email:"dreamchaser3@naver.com",status:1)
UserFriend.create(user_email:"kimhyunwoo@naver.com",friend_email:'wondangjk@naver.com',status:1)
UserFriend.create(user_email:'ohhyunju@naver.com',friend_email:"wondangjk@naver.com",status:0)
UserFriend.create(user_email:'dreamchaser3@naver.com',friend_email:"test@naver.com",status:1)
UserFriend.create(user_email:'dreamchaser3@naver.com',friend_email:"test2@naver.com",status:1)
UserFriend.create(user_email:'kimhyunwoo@naver.com',friend_email:"test@naver.com",status:1)
UserFriend.create(user_email:'kimhyunwoo@naver.com',friend_email:"test2@naver.com",status:1)
UserFriend.create(user_email:'test@naver.com',friend_email:"ohhyunju@naver.com",status:1)
UserFriend.create(user_email:'test2@naver.com',friend_email:"ohhyunju@naver.com",status:1)
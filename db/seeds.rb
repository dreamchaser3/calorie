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
User.create(email:'demo@gmail.com', password:"123456", username:"김현우")
UserFriend.create(user_email:"kimhyunwoo@naver.com",friend_email:'wondangjk@naver.com',status:1)
UserFriend.create(user_email:'ohhyunju@naver.com',friend_email:"wondangjk@naver.com",status:0)
UserFriend.create(user_email:'dreamchaser3@naver.com',friend_email:"test@naver.com",status:1)
UserFriend.create(user_email:'dreamchaser3@naver.com',friend_email:"test2@naver.com",status:1)
UserFriend.create(user_email:'kimhyunwoo@naver.com',friend_email:"test@naver.com",status:1)
UserFriend.create(user_email:'kimhyunwoo@naver.com',friend_email:"test2@naver.com",status:1)
UserFriend.create(user_email:'test@naver.com',friend_email:"ohhyunju@naver.com",status:1)
UserFriend.create(user_email:'test2@naver.com',friend_email:"ohhyunju@naver.com",status:1)

# In index.html.erb, "<%= Post.last.id + 1%>" requires that Posts always have more than one post.
# So, make a fake record in Post.
Post.create(category: -1, user_email: "-1")

Food.create(name: "쌀밥", calorie: 322)
Food.create(name: "가츠동", calorie: 650)
Food.create(name: "짜장면", calorie: 785)
Food.create(name: "냉면", calorie: 383)
Food.create(name: "라면", calorie: 385)
Food.create(name: "불고기", calorie: 486)
Food.create(name: "제육볶음", calorie: 572)
Food.create(name: "닭도리탕", calorie: 230)
Food.create(name: "멸치볶음", calorie: 69)
Food.create(name: "김치", calorie: 10)
Food.create(name: "탕수육", calorie: 591)
Food.create(name: "만두", calorie: 41)
Food.create(name: "떡볶이", calorie: 280)
Food.create(name: "순대", calorie: 269)
Food.create(name: "콩나물무침", calorie: 38)
Food.create(name: "계란말이", calorie: 336)
Food.create(name: "돈까스", calorie: 568)
Food.create(name: "깍두기", calorie: 16)
Food.create(name: "후라이드치킨(반마리)", calorie: 965)
Food.create(name: "갈비찜", calorie: 597)
Food.create(name: "갈비탕", calorie: 466)
Food.create(name: "김치전", calorie: 153)
Food.create(name: "김치찌개", calorie: 121)
Food.create(name: "깻잎조림", calorie: 24)
Food.create(name: "동그랑땡", calorie: 30)
Food.create(name: "된장찌개", calorie: 176)
Food.create(name: "미역국", calorie: 83)
Food.create(name: "비빔국수", calorie: 425)
Food.create(name: "비빔밥", calorie: 586)
Food.create(name: "삼계탕", calorie: 454)
Food.create(name: "스팸구이", calorie: 180)
Food.create(name: "육개장", calorie: 165)
Food.create(name: "잡채", calorie: 285)
Food.create(name: "콩나물국", calorie: 41)
Food.create(name: "새우튀김(3조각)", calorie: 48)
Food.create(name: "샐러드", calorie: 184)
Food.create(name: "우동", calorie: 361)
Food.create(name: "야채튀김(3조각)", calorie: 33)
Food.create(name: "장조림", calorie: 166)
Food.create(name: "보쌈", calorie: 581)
class CreateUserFriends < ActiveRecord::Migration
  def change
    create_table :user_friends do |t|
       t.string :user_email,              null: false, default: ""
       t.string :friend_email,              null: false, default: ""
       # status: 0 -> 친구 요청중, 1-> 친구
       t.integer :status, null: false, default: 0
      t.timestamps null: false
    end
  end
end

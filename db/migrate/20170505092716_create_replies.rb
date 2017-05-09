class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content, null: false
      t.integer :post_id, null: false
      t.string :user_email, null: false
      # status: 0(읽음) 1(안읽음)
      t.integer :status, null:false, default: 1
      t.timestamps null: false
    end
  end
end

class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content, null: false
      t.integer :post_id, null: false
      t.string :user_email, null: false
      t.timestamps null: false
    end
  end
end

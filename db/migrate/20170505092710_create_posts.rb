class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :img, null: false
      t.string :title, null: true
      t.string :content, null: true
      # category: 0->아침, 1->점심, 2->저녁
      t.integer :category, null: false
      t.string :user_email, null: false
      t.decimal :calorie,       precision: 10, scale: 2
      t.timestamps null: false
    end
  end
end

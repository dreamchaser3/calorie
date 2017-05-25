class CreatePostFoods < ActiveRecord::Migration
  def change
    create_table :post_foods do |t|
      t.integer   :post_id
      t.integer   :food_id
      t.timestamps null: false
    end
  end
end

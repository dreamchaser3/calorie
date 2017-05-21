class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string  :name, null: false
      t.integer :calorie, null: false
      t.timestamps null: false
    end
  end
end

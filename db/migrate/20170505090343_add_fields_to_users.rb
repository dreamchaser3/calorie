class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :background_img, :string
    add_column :users, :profile_img, :string
  end
end

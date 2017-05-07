class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :background_img, :string, :default => "http://article.images.consumerreports.org/prod/content/dam/cro/news_articles/health/CR-Health-Crop-Food-Child-10-16"
    add_column :users, :profile_img, :string, :default => "https://help.github.com/assets/images/help/profile/identicon.png"
  end
end

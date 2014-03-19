class AddParamsToUser < ActiveRecord::Migration
  def change
    add_column :users, :twitter_profile, :string
    add_column :users, :facebook_profile, :string
    add_column :users, :youtube_profile, :string
    add_column :users, :google_plus_profile, :string
    add_column :users, :name, :string
    add_column :users, :bio, :text
    add_column :users, :city, :string
  end
end

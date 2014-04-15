class AddLunchOptionToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :lunch_option_id, :integer
  end
end

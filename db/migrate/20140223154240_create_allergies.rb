class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.integer :ingredient_id
      t.text :desc

      t.timestamps
    end
  end
end

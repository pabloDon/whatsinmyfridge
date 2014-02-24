class AddMeasurementAndQtyToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :measurement_id, :integer
    add_column :ingredients, :qty, :float
  end
end

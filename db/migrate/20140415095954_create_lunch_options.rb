class CreateLunchOptions < ActiveRecord::Migration
  def change
    create_table :lunch_options do |t|
      t.string :name

      t.timestamps
    end
  end
end

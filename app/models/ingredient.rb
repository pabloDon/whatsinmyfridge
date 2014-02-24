class Ingredient < ActiveRecord::Base
  attr_accessible :name, :measurement_id, :qty
  has_many :recipes, through: :ingredient_recipes
  has_many :ingredient_recipes
  
  
  belongs_to :measurement
  
end

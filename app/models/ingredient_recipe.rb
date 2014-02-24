class IngredientRecipe < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id
  belongs_to :ingredient, :foreign_key => :ingredient_id
  belongs_to :recipe, :foreign_key => :recipe_id
end

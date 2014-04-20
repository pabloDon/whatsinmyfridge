class StaticController < ApplicationController
  def index
    @recipe_title = "Las mejores recetas de la red"
    @primero = Recipe.where(:lunch_option_id => 4).sample(4)
    @segundo = Recipe.where(:lunch_option_id => 2).sample(4)
    @postre = Recipe.where(:lunch_option_id => 3).sample(4)
  end
end

class Recipe < ActiveRecord::Base
  attr_accessible :global_rating, 
                  :instructions, 
                  :name, 
                  :ingredients_attributes,
                  :user_id
  has_many :ingredients, through: :ingredient_recipes
  has_many :ingredient_recipes
  #has_many :ingredients, :dependent => :destroy
  belongs_to :chef, :class_name => 'User', :foreign_key => 'user_id'
  
  validates :name, :presence => true
  validates :instructions, :presence => true
  
  validate :recipe_must_have_at_least_one_ingredient
  
  def recipe_must_have_at_least_one_ingredient
  end
  
  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |i| i[:name].blank? }
end

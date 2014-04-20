class Comment < ActiveRecord::Base
  attr_accessible :desc, :recipe_id, :user_id
  
  belongs_to :user
  belongs_to :recipe
end

class User < ActiveRecord::Base
  acts_as_authentic do |c|
      c.validate_email_field = false
    end # block optional
  
  attr_accessible :crypted_password, 
                  :email, 
                  :login, 
                  :password_salt, 
                  :perishable_token, 
                  :persistence_token, 
                  :password, 
                  :password_confirmation,
                  :name,
                  :bio,
                  :city,
                  :twitter_profile,
                  :facebook_profile,
                  :google_plus_profile,
                  :youtube_profile
                  
  has_many :recipes
  has_many :comments
  
  has_many :favorites

end

class User < ActiveRecord::Base
  acts_as_authentic do |c|
      c.validate_email_field = true
    end # block optional
  
  attr_accessible :crypted_password, :email, :login, :password_salt, :perishable_token, :persistence_token

end

class User < ActiveRecord::Base
  attr_accessible :password, :username
  
  has_many :shops
  
  def self.authenticate(name, password)
    if user = User.find_by_username(name)
      if user.password == password
        user
	  end
	end
  end
end

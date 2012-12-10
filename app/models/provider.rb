class Provider < ActiveRecord::Base
  attr_accessible :provider_name, :provider_type
  
  def self.like(name)
    name.nil? ? [] : where(['provider_name LIKE ?', "%#{name}%"])
  end
  
end

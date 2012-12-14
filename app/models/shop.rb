class Shop < ActiveRecord::Base
  attr_accessible :description, :name, :timeplan_id, :user_id
  
  def self.like(name)
    name.nil? ? [] : where(['name LIKE ?', "%#{name}%"])
  end
  
end

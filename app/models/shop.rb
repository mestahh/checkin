class Shop < ActiveRecord::Base
  attr_accessible :description, :name, :timeplan_id, :user_id
  
  belongs_to :user
  
  def self.like(name)
    name.nil? ? [] : where(['name LIKE ?', "%#{name}%"])
  end
  
end

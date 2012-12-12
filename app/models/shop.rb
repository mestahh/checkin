class Shop < ActiveRecord::Base
  attr_accessible :description, :name, :timeplan_id, :user_id
end

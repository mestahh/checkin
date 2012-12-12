class Service < ActiveRecord::Base
  attr_accessible :description, :length, :name, :shop_id
  
  belongs_to :shop
end

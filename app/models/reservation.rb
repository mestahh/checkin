class Reservation < ActiveRecord::Base
  attr_accessible :service_id, :start_time, :user_id, :shop_id
  
  belongs_to :shop
  belongs_to :service
  
  def to_s 
    'id: ' + service_id.to_s + ', start time: ' + start_time.to_s + ' user id: ' + user_id.to_s
  end 
  
end

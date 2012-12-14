class Reservation < ActiveRecord::Base
  attr_accessible :service_id, :start_time, :user_id
  
  def to_s 
    'id: ' + service_id.to_s + ', start time: ' + start_time.to_s + ' user id: ' + user_id.to_s
  end 
end

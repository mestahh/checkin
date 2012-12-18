require 'factory_girl'

FactoryGirl.define do
  factory :user do |user|
    user.username 'Bob'
	  user.password 'pass'
  end
  
  factory :shop do |shop|
    shop.name 'ShopName'
	  shop.user_id 1
	  shop.description 'Shop description'
	  shop.timeplan_id 1
  end
  
  factory :service do |service|
    service.name 'ServiceName'
	  service.shop_id 1
	  service.description 'description'
	  service.length 60
  end
  
  factory :reservation do |reservation|
    reservation.service_id 1
	  reservation.shop_id 1
	  reservation.user_id 1
	  reservation.start_time '2012-12-12 12:12:12'
  end
end
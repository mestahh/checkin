require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.username 'Bob'
	f.password 'pass'
  end
  
  factory :shop do |s|
    s.name 'ShopName'
	s.user_id 1
	s.description 'Shop description'
	s.timeplan_id 1
  end
  
  factory :service do |service|
    service.name 'ServiceName'
	service.shop_id 1
	service.description 'description'
	service.length 60
  end
end
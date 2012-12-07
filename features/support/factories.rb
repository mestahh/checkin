require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.username 'Bob'
	f.password 'pass'
  end
end
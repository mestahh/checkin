require 'factory_girl'

FactoryGirl.define do
  factory :user do |f|
    f.username 'Bob'
	f.password 'test'
  end
end
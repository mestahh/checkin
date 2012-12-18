Given /^there is a shop and a service$/ do
  @shop = FactoryGirl.create(:shop)
  @service = FactoryGirl.create(:service)
end

When /^I visit the shop and select the service$/ do
  visit shop_path(@shop.id) 
  select 'ServiceName', {:from => 'service'}
  click_button 'Next'
end

Then /^I should see the service page$/ do
  current_path.should == service_path(@service.id)
end

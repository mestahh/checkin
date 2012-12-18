When /^I open a page of that shop$/ do
  visit shop_path(@shop.id)
end

When /^I have a shop with a service$/ do
  @shop = FactoryGirl.create(:shop)
  @service = FactoryGirl.create(:service)
end

When /^I select a service and a start time for a reservation$/ do
  select 'ServiceName', {:from => 'service'}
  click_button 'Next'
  fill_in 'start_time', :with => '2012-12-12 12:12:12'
  click_button 'Reserve'
end

Then /^a reserval is made in the database$/ do
  @res = Reservation.find(:all)[0];
  @res.should_not == nil
  @res.user_id.should == 1
  @res.service_id.should == 1
  @res.shop_id.should == @shop.id
  @res.start_time.should == '2012-12-12 12:12:12'
end

Then /^I should see my reservals$/ do
  current_path.should == reservations_path
end

Given /^there is a service with a reservation$/ do
  
  @service = FactoryGirl.create(:service, name: "service")
  
  @reservation = Reservation.new
  @reservation.service_id = @service.id
  @reservation.shop_id = @service.shop.id
  @reservation.user_id = 1
  @reservation.start_time = '2012-12-12 12:00:00'
  @reservation.save
end

When /^I select the service and an overlapping start time for a reservation$/ do
  select 'service', {:from => 'service'}
  click_button 'Next'
  fill_in 'start_time', :with => '2012-12-12 12:12:12'
  click_button 'Reserve'
end

Then /^a reserval should not be saved$/ do
  Reservation.count.should == 1
end

Then /^an error message should be shown$/ do
  page.should have_content 'The reservation overlaps with another one. Please choose anoter start time.';
end

Given /^there is a different service with a reservation$/ do
  @serv = FactoryGirl.create(:service, name: "service")
  @service = FactoryGirl.create(:service, name: "differentService")
  
  @reservation = Reservation.new
  @reservation.service_id = @service.id
  @reservation.shop_id = @service.shop.id
  @reservation.user_id = 1
  @reservation.start_time = '2012-12-12 12:00:00'
  @reservation.save
end

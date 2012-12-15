When /^I open a page of a certain shop$/ do
  @shop = FactoryGirl.create(:shop)
  @service = FactoryGirl.create(:service)
  visit shop_path(@shop)
end

When /^I select a service and a start time for a reservation$/ do
  select 'ServiceName', {:from => 'service'}
  click_button 'Next'
  fill_in 'start_time', :with => '2012-12-12 12:12:12'
  click_button 'Reserve'
end

Then /^a reserval is made in the database$/ do
  @res = Reservation.find(1)
  @res.should_not == nil
  @res.user_id.should == 1
  @res.service_id.should == 1
  @res.start_time.should == '2012-12-12 12:12:12'
end

Then /^I should see my reservals$/ do
  current_path.should == reservations_path
end

Given /^there is a service with a reservation$/ do
  @reservation = Reservation.new
  @reservation.service_id = 1
  @reservation.user_id = 1
  @reservation.start_time = '2012-12-12 12:00:00'
  @reservation.save
end

When /^I select the service and an overlapping start time for a reservation$/ do
  select 'ServiceName', {:from => 'service'}
  click_button 'Next'
  fill_in 'start_time', :with => '2012-12-12 12:12:12'
  click_button 'Reserve'
end

Then /^a reserval should not be saved$/ do
  Reservation.count.should == 2
end

Then /^an error message should be shown$/ do
  pending # express the regexp above with the code you wish you had
end

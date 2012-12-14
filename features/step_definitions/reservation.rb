When /^I open a page of a certain shop$/ do
  @shop = FactoryGirl.create(:shop)
  @service = FactoryGirl.create(:service)
  visit shop_path(@shop)
end

When /^I select a service and a timebox for that reservation$/ do
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

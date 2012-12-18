Given /^I have a reservation for a service in that shop$/ do
  @reservation = FactoryGirl.create(:reservation)
end

Given /^there is a reservation for another service$/ do
  @different_service = FactoryGirl.create(:service, name: "differentService")
  @reservation = FactoryGirl.create(:reservation, start_time: '2012-12-12 12:00:00', service_id: @different_service.id)
end

Given /^another user has a different reservation$/ do
  @anotherUser = FactoryGirl.create(:user, username: 'another');
  @diffRes = FactoryGirl.create(:reservation, user_id: @anotherUser.id)
end

Given /^there is a reservation for the service$/ do
  @reservation = FactoryGirl.create(:reservation, start_time: '2012-12-12 12:00:00')
end

When /^I open the page of that shop$/ do
  visit shop_path(@shop.id)
end

When /^there is a shop with a service$/ do
  @anotherUser = FactoryGirl.create(:user, username: 'another')
  @shop = FactoryGirl.create(:shop, user_id: @anotherUser.id)
  @service = FactoryGirl.create(:service)
end

When /^I select a service and enter a start time for a reservation$/ do
  select_service_and_enter_time '2012-12-12 12:12:12'
end

When /^I select the service and enter an overlapping start time for a reservation$/ do
  select_service_and_enter_time '2012-12-12 12:12:12'
end

When /^when I click on the reservations link$/ do
  click_link 'Reservations'
end

When /^deletes my reservation$/ do
  click_link 'Delete'
end

When /^I open the page of the reservations of that shop$/ do
  visit reservations_path(:shop_id => @shop.id)
end

Then /^I would like to see the reservations page$/ do
  current_path.should == reservations_path
end

Then /^a reserval is created in the database$/ do
  @res = Reservation.find(:all)[0];
  @res.should_not == nil
  @res.user_id.should == 1
  @res.service_id.should == 1
  @res.shop_id.should == @shop.id
  @res.start_time.should == '2012-12-12 12:12:12'
end

Then /^a reserval should not be saved$/ do
  Reservation.count.should == 1
end

Then /^I would like to see an updated list$/ do
  Reservation.count.should == 0
  current_path.should == reservations_path
end

Then /^an error message should be shown$/ do
  page.should have_content 'The reservation overlaps with another one. Please choose anoter start time.';
end

When /^I open the reservations page$/ do
 visit reservations_path
end

Then /^I would like to see my reservation$/ do
  page.should have_content @reservation.to_s
end

Then /^dont want to see other users reservation$/ do
  page.should_not have_content @diffRes.to_s
end

private 

  def select_service_and_enter_time(start_time)
    select 'ServiceName', {:from => 'service'}
    click_button 'Next'
    fill_in 'start_time', :with => start_time
    click_button 'Reserve'  
  end



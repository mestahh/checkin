Given /^there is a shop with two reservations for one of its service$/ do
  @shop = FactoryGirl.create(:shop)
  @service = FactoryGirl.create(:service)
  @res1 = FactoryGirl.create(:reservation, start_time: '2012-12-11 12:12:12')
  @res2 = FactoryGirl.create(:reservation, start_time: '2012-12-12 12:12:12')
end

When /^I visit the page of that shop$/ do
  visit shop_path(:id => @shop.id)
end

When /^follow the reservations link$/ do
  click_link 'Reservations'
end

Then /^I should see the two reservations$/ do
  page.should have_content @res1.to_s
  page.should have_content @res2.to_s
end
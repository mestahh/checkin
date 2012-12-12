When /^I open a page of a certain shop$/ do
  @shop = FactoryGirl.create(:shop)
  @service = FactoryGirl.create(:service)
  visit shop_path(@shop)
end

When /^I select a service and a timebox for that reservation$/ do
  
  pending # express the regexp above with the code you wish you had
end

Then /^a reserval is made in the database$/ do
  pending # express the regexp above with the code you wish you had
end

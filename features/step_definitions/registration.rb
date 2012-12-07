Given /^there is no user with the name "(.*?)"$/ do |username|
  User.find_by_username(username).should == nil
end

When /^I open in the registration page$/ do
  visit(register_path)
end

When /^enter the "(.*?)" "(.*?)"$/ do |field_name, value|
  fill_in field_name, :with => value
end

When /^submits the form$/ do
  click_button "Register"
end

Then /^there should be one user in the database\.$/ do
  User.count.should == 1
end

Then /^I should see a success page$/ do
  current_path.should == "/success/index"
end

Given /^there is no user with the name "(.*?)"$/ do |username|
  User.find_by_username(username).should == nil
end

Given /^there is a user with the name "(.*?)"$/ do |username|
  existing_user = User.new
  existing_user.username = username
  existing_user.save
  User.find_by_username(username).should_not == nil
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

Then /^there should be "(.*?)" user in the database\.$/ do |number_of_users|
  User.count.should == number_of_users.to_i
end

Then /^I should see the "(.*?)" page$/ do |page_path|
  current_path.should == "/" + page_path
end



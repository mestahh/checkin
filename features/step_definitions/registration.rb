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

When /^fill in the registration form$/ do
  fill_in "username", :with => "Bob"
  fill_in "password", :with => "pass"
end

When /^submits the form$/ do
  click_button "Register"
end

Then /^there should be one user in the database\.$/ do
  User.count.should == 1
end




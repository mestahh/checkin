Given /^"(.*?)" is an existing user with password "(.*?)"$/ do |name, password|
  @user = FactoryGirl.create(:user)
end

When /^he logs in on the login page with valid credentials$/ do
  visit(login_path)
  fill_in "username", :with => @user.username
  fill_in "password", :with => @user.password
  click_button "Log in"
end

When /^he logs in on the login page with invalid credentials$/ do
  visit(login_path)
  fill_in "username", :with => @user.username
  fill_in "password", :with => "wrongpass"
  click_button "Log in"
end

Then /^he should see the "(.*?)" page$/ do |page|
  current_path.should == "/" + page
end
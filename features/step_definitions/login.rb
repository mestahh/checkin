Given /^"(.*?)" is an existing user with password "(.*?)"$/ do |name, password|
  @user = FactoryGirl.create(:user)
end

Given /^"(.*?)" is logged in with password "(.*?)"$/ do |name, password|
  login(name, password)
end

When /^he visits the login page$/ do
  visit(login_path)
end

When /^he logs in on the login page as "(.*?)" with password "(.*?)"$/ do |username, password|
  login(username, password)
end

Then /^he should see the "(.*?)" page$/ do |page|
  current_path.should == "/" + page
end

def login(username, password)
  visit(login_path)
  fill_in "username", :with => username
  fill_in "password", :with => password
  click_button "Log in"
end


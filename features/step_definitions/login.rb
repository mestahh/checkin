Given /^"(.*?)" is an existing user with password "(.*?)"$/ do |name, password|
  @user = FactoryGirl.create(:user)
end

When /^he logs in on the login page as "(.*?)" with password "(.*?)"$/ do |username, password|
  visit(login_path)
  fill_in "username", :with => username
  fill_in "password", :with => password
  click_button "Log in"
end

Then /^he should see the "(.*?)" page$/ do |page|
  current_path.should == "/" + page
end

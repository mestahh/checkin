Given /^I have an existing user$/ do
  @user = FactoryGirl.create(:user)
end

When /^I log in with correct credentials$/ do
  login("Bob", "pass")
end

When /^I log in with an incorrect password$/ do
  login("Bob", "wrongpass")
end

When /^I log in with an incorrect username$/ do
  login("NotBob", "pass")
end

When /^I visit the login page$/ do
  visit(login_path)
end

When /^I hit log out$/ do
  click_link "Log out"
end

When /^I log in with empty fields$/ do
  login("", "")
end

Then /^I should see password error message$/ do
  page.should have_content("The password was incorrect.")
end

Then /^I should see the username error message$/ do
  page.should have_content("The username does not exist.")
end

Then /^I should see successful logout message$/ do
  page.should have_content("Successful log out.")
end

Given /^I am not logged in$/ do
  #do nothing
end

When /^I visit the page$/ do
  visit "/"
end

Then /^I should see the login page$/ do
  page.should have_content("Please Log in")
end










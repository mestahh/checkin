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









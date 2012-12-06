Given /^"(.*?)" is an existing user with password "(.*?)"$/ do |name, password|
  FactoryGirl.create(:user)
end

When /^he logs in on the login page with valid credentials$/ do
  pending 
end

Then /^he should see the main page$/ do
  pending # express the regexp above with the code you wish you had
end
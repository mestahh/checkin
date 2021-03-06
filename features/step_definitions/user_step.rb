When /^I visit the edit user page$/ do
  visit edit_user_path(:id => @user.id)
end

When /^I change my data$/ do
  fill_in "username", :with => "Tim"
  fill_in "password", :with => "timspass"
  click_button "Edit"
end

When /^I visit the edit user page of a different user$/ do
  @anotherUser = FactoryGirl.create(:user, username: 'another')
  visit edit_user_path(:id => @anotherUser.id)
end

Then /^the changes should be saved in the database$/ do
  User.find_by_username("Tim").should_not == nil
end


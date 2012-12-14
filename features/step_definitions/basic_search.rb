Given /^there are the following shops$/ do |shops|
   shops_attributes = shops.hashes.map do |shop_attrs|
     shop_attrs.merge({:description => "Shop description", :timeplan_id => 1, :user_id => 1})
   end
   Shop.create!(shops_attributes)
end

Given /^I have a shop$/ do
  @shop = Shop.new
  @shop.name = 'Test'
  @shop.description = 'description of the shop'
  @shop.timeplan_id = 1
  @shop.user_id = 1
  @shop.save
 end

When /^I search for Sa$/ do 
  visit '/search'
  fill_in 'query', :with => 'Sa'
  click_button 'Search'
end

Then /^the result should be$/ do |expected_results|
  results = [['name']] + page.all('ol.results li').map do |li|
    [li.text]
  end 
  expected_results.diff!(results)
end

When /^I search for its name$/ do
  visit '/search'
  fill_in 'query', :with => @shop.name
  click_button 'Search'
end

When /^I click on the results name$/ do
  click_link @shop.name 
end

Then /^the shop should be displayed$/ do
  current_path.should == "/shops/" + @shop.id.to_s
end
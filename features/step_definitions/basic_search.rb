Given /^there are the following providers$/ do |providers|
   providers_attributes = providers.hashes.map do |provider_attrs|
     provider_attrs.merge({:provider_type => "Shop"})
   end
   Provider.create!(providers_attributes)
end

Given /^I have a provider$/ do 
  @provider = Provider.new
  @provider.provider_name = 'Test'
  @provider.provider_type = 'type'
  @provider.save
end

When /^I search for Sa$/ do 
  visit '/search'
  fill_in 'query', :with => 'Sa'
  click_button 'Search'
end

Then /^the result should be$/ do |expected_results|
  results = [['provider_name']] + page.all('ol.results li').map do |li|
    [li.text]
  end 
  expected_results.diff!(results)
end

When /^I search for its name$/ do
  visit '/search'
  fill_in 'query', :with => @provider.provider_name
  click_button 'Search'
end

When /^I click on the results name$/ do
  click_link @provider.provider_name 
end

Then /^the provider should be displayed$/ do
  current_path.should == "/providers/" + @provider.id.to_s
end
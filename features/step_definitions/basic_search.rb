Given /^there are the following providers$/ do |providers|
   providers_attributes = providers.hashes.map do |provider_attrs|
     provider_attrs.merge({:provider_type => "Shop"})
   end
   Provider.create!(providers_attributes)
end

When /^I search for "(.*?)"$/ do |search_string|
  visit '/search'
  fill_in 'query', :with => search_string
  click_button 'Search'
end

Then /^the result should be$/ do |expected_results|
  results = [['provider_name']] + page.all('ol.results li').map do |li|
    [li.text]
  end 
  expected_results.diff!(results)
end

Given /^I have a provider called "(.*?)"$/ do |provider_name|
  @provider = Provider.new
  @provider.provider_name = provider_name
  @provider.provider_type = 'type'
  @provider.save
end

When /^I click on the results name$/ do
  click_link @provider.provider_name 
end

Then /^the provider should be displayed$/ do
  current_path.should == "/providers/" + @provider.id.to_s
end
Given /^there are the following providers:$/ do |providers|
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
  pending
end
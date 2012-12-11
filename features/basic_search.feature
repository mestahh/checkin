Feature: Basic search with a search page for a provider

  Scenario: Find a service provider by its name
    Given there are the following providers
	  | provider_name |
	  | Barber        |
	  | Saloon        |
	  | Sandra's shop |
	  | Beautician    |
	When I search for "Sa"
	Then the result should be 
	  | provider_name |
	  | Saloon        |
	  | Sandra's shop |
	  
  Scenario: Click on a search result should display the provider
    Given I have a provider called "Test"
	When I search for "Test"
	When I click on the results name
	Then the provider should be displayed
	  
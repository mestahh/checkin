Feature: Basic search with a search page

  Scenario: Find a service provider by its name
    Given there are the following providers:
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
	  
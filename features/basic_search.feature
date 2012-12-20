Feature: Basic search with a search page for a shop

  Scenario: Find a shop by its name
    Given there are the following shops
	  | name          |
	  | Barber        |
	  | Saloon        |
	  | Sandra's shop |
	  | Beautician    |
    When I search for Sa
    Then the result should be 
	  | name          |
	  | Saloon        |
	  | Sandra's shop |
	  
  Scenario: Click on a shops name in the result list should display the shop
    Given I have a shop
    When I search for its name 
    And I click on the results name
    Then the shop should be displayed
	  
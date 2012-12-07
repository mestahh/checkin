Feature: Register a user

  Scenario: successful registration
    Given there is no user with the name "Bob"
	When I open in the registration page
	And enter the "username" "Bob"
    And enter the "password" "pass"
	And submits the form
	Then there should be "1" user in the database.
	And I should see the "success/index" page
	
  Scenario: unsuccessful registration, existing username
    Given there is a user with the name "Bob"
	When I open in the registration page
	And enter the "username" "Bob"
    And enter the "password" "pass"
	And submits the form
	Then there should be "1" user in the database.
	And I should see the "error/index" page


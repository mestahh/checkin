Feature: Register a user

  Scenario: successful registration
    Given there is no user with the name "Bob"
	When I open in the registration page
	And enter the "username" "Bob"
    And enter the "password" "pass"
	And submits the form
	Then there should be one user in the database.
	And I should see a success page


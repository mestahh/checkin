Feature: Register a user

  Scenario: successful registration
    Given there is no user with the name "Bob"
	When I open in the registration page
	And fill in the registration form
	And submits the form
	Then there should be one user in the database.
	And I should see the "success/index" page
	
  Scenario: unsuccessful registration, existing username
    Given there is a user with the name "Bob"
	When I open in the registration page
	And fill in the registration form
	And submits the form
	Then there should be one user in the database.
	And I should see the "error/index" page
	
  Scenario: registration should be possible from the main page
    Given I am not logged in
	When I visit the page
	And click on the register link
	Then I should see the "register" page


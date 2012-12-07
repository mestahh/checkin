Feature: Login

  Scenario: Successful login
    Given I have an existing user
	When I log in with correct credentials
	Then I should see the "main/index" page
	
  Scenario: The user tries to log in with a wrong password
    Given I have an existing user
	When I log in with an incorrect password
	Then I should see the "login" page
	
  Scenario: The user tries to log in with a non-existing username
    Given I have an existing user
	When I log in with an incorrect username
	Then I should see the "login" page
	
  Scenario: The logged in user opens the login page
    Given I have an existing user
    And I am logged in
	When I visit the login page
	Then I should see the "main/index" page
	
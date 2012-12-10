Feature: Login

  Scenario: Successful login
    Given I have an existing user
	When I log in with correct credentials
	Then I should see the "main/index" page
	
  Scenario: The user tries to log in with a wrong password
    Given I have an existing user
	When I log in with an incorrect password
	Then I should see the "login" page
	And I should see password error message
	
  Scenario: The user tries to log in with a non-existing username
    Given I have an existing user
	When I log in with an incorrect username
	Then I should see the "login" page
	And I should see the username error message
	
  Scenario: The logged in user opens the login page
    Given I have an existing user
    And I am logged in
	When I visit the login page
	Then I should see the "main/index" page
	
  Scenario: Log out
    Given I have an existing user
	And I am logged in
	When I hit log out
	Then I should see the "login" page
	And I should see successful logout message
	
  Scenario: Log in with empty fields
    Given I visit the login page
	When I log in with empty fields
	Then I should see the "login" page
	
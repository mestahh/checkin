Feature: Login

  Scenario: Successful login as a user
    Given "Bob" is an existing user with password "pass"
	When he logs in on the login page with valid credentials
	Then he should see the "main/index" page
	
  Scenario: The user tries to log in with a wrong password
    Given "Bob" is an existing user with password "pass"
	When he logs in on the login page with invalid credentials
	Then he should see the "login" page
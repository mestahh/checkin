Feature: Login

  Scenario: Successful login as a user
    Given "Bob" is an existing user with password "pass"
	When he logs in on the login page with valid credentials
	Then he should see the main page
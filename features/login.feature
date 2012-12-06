Feature: Login

  Scenario: Successful login as a user
    Given "Bob" wants to log in
	When he enters "pass" as a password
	Then he should see the main page
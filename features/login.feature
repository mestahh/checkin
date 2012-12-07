Feature: Login

  Scenario: Successful login as a user
    Given "Bob" is an existing user with password "pass"
	When he logs in on the login page as "Bob" with password "pass"
	Then he should see the "main/index" page
	
  Scenario: The user tries to log in with a wrong password
    Given "Bob" is an existing user with password "pass"
	When he logs in on the login page as "Bob" with password "wrongpass"
	Then he should see the "login" page
	
  Scenario: The user tries to log in with a non-existing username
    Given "Bob" is an existing user with password "pass"
	When he logs in on the login page as "NotBob" with password "pass"
	Then he should see the "login" page
	
  Scenario: The logged in user opens the login page
    Given "Bob" is an existing user with password "pass"
    Given "Bob" is logged in with password "pass"
	When he visits the login page
	Then he should see the "main/index" page
	
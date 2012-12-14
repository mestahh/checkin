Feature: A user can reserve a time-slot for a service

  Scenario: Successful service reserval
    Given I have an existing user
	And I am logged in
	When I open a page of a certain shop
	And I select a service and a timebox for that reservation
	Then a reserval is made in the database
	And I should see my reservals
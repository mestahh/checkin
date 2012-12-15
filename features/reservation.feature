Feature: A user can reserve a time-slot for a service

  Scenario: Successful service reserval
    Given I have an existing user
	And I am logged in
	When I open a page of a certain shop
	And I select a service and a start time for a reservation
	Then a reserval is made in the database
	And I should see my reservals
	
  Scenario: Unsuccessful reservation, time overlaps
    Given I have an existing user
	And I am logged in
	And there is a service with a reservation
	When I open a page of a certain shop
	And I select the service and an overlapping start time for a reservation
	Then a reserval should not be saved
	And an error message should be shown
	
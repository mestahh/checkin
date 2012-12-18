Feature: A user can reserve a time-slot for a service

Background: I have a user and I am logged in

  I have a user and I am logged in and I have an existing shop in the database
  with one service.

    Given I have an existing user
    And I am logged in
    And I have a shop with a service

  Scenario: Successful service reserval

    When I open the page of that shop
    And I select a service and enter a start time for a reservation
    Then a reserval is created in the database
    And I should see my reservals
	
  Scenario: Unsuccessful reservation, time overlaps for the same service

    And there is a reservation for the service
    When I open the page of that shop
    And I select the service and enter an overlapping start time for a reservation
    Then a reserval should not be saved
    And an error message should be shown

  Scenario: Unsuccessful reservation, time overlaps for the same shop

    And there is a reservation for another service
    When I open the page of that shop
    And I select the service and enter an overlapping start time for a reservation
    Then a reserval should not be saved
    And an error message should be shown
	
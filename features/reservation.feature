Feature: A user can reserve a time-slot for a service

  Background: I have a user and I am logged in

  I have a user and I am logged in and I have an existing shop in the database
  with one service.

    Given I have an existing user
    And I am logged in
    And there is a shop with a service

      Scenario: Successful service reserval

        When I open the page of that shop
        And I select a service and enter a start time for a reservation
        Then a reserval is created in the database
        And I would like to see the reservations page

      Scenario: Unsuccessful reservation, time overlaps for the same service

        Given there is a reservation for the service
        When I open the page of that shop
        And I select the service and enter an overlapping start time for a reservation
        Then a reserval should not be saved
        And an error message should be shown

      Scenario: Unsuccessful reservation, time overlaps for the same shop

        Given there is a reservation for another service
        When I open the page of that shop
        And I select the service and enter an overlapping start time for a reservation
        Then a reserval should not be saved
        And an error message should be shown

      Scenario: I would like to list the reservations for a shop

        When I open the page of that shop
        And when I click on the reservations link
        Then I would like to see the reservations page

      Scenario: I would like to be able to delete my reservation

        Given I have a reservation for a service in that shop
        When I open the page of the reservations of that shop
        And deletes my reservation
        Then I would like to see an updated list

      Scenario: I would like to list all my reservations

        Given I have a reservation for a service in that shop
        And another user has a different reservation
        When I open the reservations page
        Then I would like to see my reservation
        And dont want to see other users reservation


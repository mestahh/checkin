Feature: Reservations for a shop are listed

  Scenario: A shop has two reservations
    Given I am logged in
    Given there is a shop with two reservations for one of its service
    When I visit the page of that shop
    And follow the reservations link
    Then I should see the two reservations
Feature: an anonymous user should not make a reservation

  Scenario: an anonymous user tries to reserve a service
    Given I am not logged in
    And there is a shop and a service
    When I visit the shop and select the service
    Then I should see the service page
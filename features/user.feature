Feature: A user can edit its own data

  Scenario: The user change its data
    Given I have an existing user
    And I am logged in
    When I visit the edit user page
    And I change my data
    Then the changes should be saved in the database
    And I should see the "success/index" page
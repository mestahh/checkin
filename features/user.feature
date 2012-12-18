Feature: A user can edit its own data

  Background: I have a user and I am logged in
    Given I have an existing user
    And I am logged in

  Scenario: The user change its data
    When I visit the edit user page
    And I change my data
    Then the changes should be saved in the database
    And I should see the "success/index" page

  Scenario: A user can not edit another user data
   When I visit the edit user page of a different user
   Then I should see the "error/index" page
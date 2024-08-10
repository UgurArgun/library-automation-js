@lib02
Feature: Logout from the application

  As a user, I should be able to logout from the app.

  #* AC1: user should log out from the homepage by clicking the “Log out”  button under the account name.


  # TODO: verify users can logout from the app
  Background:
    Given user is already on the login page

  Scenario Outline: Verify users can logout from app
    Given user is already logged in as "<user-type>"
    When user clicks the profile on top right corner of the page
    And user clicks the logout button
    Then user should be logged out successfully
    Examples:
      | user-type |
      | admin     |
      | student   |
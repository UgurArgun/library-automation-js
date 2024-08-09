Feature: Logout from the application

  As a user, I should be able to logout from the app.

  #* AC1: user should log out from the homepage by clicking the “Log out”  button under the account name.


  # TODO: verify users can logout from the app
  Background:
    Given user is already on the homepage

  Scenario: Verify users can logout
    When user clicks on account name
    And user clicks the logout button
    Then user is able to logout successfull and on the login page

#? Should there be more scenarios for this user story? Feel free to add more scenarios.
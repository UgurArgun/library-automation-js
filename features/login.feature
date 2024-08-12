@login
Feature: Login to the application
  As a user, I want to login so that I can access the app's main features.

  #* AC1: users should be able to log in with valid credentials and launch to the homepage.
  #* AC2: users should see a "Sorry, Wrong Email or Password" error pop-up message if any users try to log in with invalid credentials.
  #* AC3: users should see a “This field is required.” error pop-up message when they attempt to log in without any credentials.


  Background:
    Given user is already on the login page
  @lib01-01
  #TODO: Verify users are able to log in with valid credentials
  Scenario Outline: Verify users can login with valid credentials
    When user enters valid username '<user-type>'
    And user enters valid password '<password>'
    And user clicks the login button
    Then user login successfully to the homepage
    Examples:
      | user-type |
      | admin     |
      | student   |

  @lib01-02
  # TODO: Verify users cannot login with invalid credentials
  Scenario Outline: Verify users cannot login with invalid credentials
    When user enters invalid username '<invalid-username>'
    And user enters invalid password '<invalid-password>'
    And user clicks the login button
    Then user is not able to login to the homepage
    And user should see a "Sorry, Wrong Email or Password" error pop-up
    Examples:
      | invalid-username | invalid-password |
      | library@student  | password123      |
      | library@cydeo    | library password |

  @lib01-03
  # TODO: Verify users cannot login with invalid credentials
  Scenario Outline: Verify users cannot login with valid username and invalid password
    When user enters valid username '<-user-type>'
    And user enters invalid password '<invalid-password>'
    And user clicks the login button
    Then user is not able to login to the homepage
    Examples:
      | user-type | invalid-password |
      | admin     |                  |
      | admin     | a1b2c3           |
      | student   |                  |
      | student   | a1b2c3           |
      |           |                  |
#? Should there be more scenarios for this user story? Feel free to add more scenarios.



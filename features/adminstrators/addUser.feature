Feature: Add Users Functionality

    As an admin, I should be able to add users on the "Users" page.

    #! Acceptance Criteria are missing :(
    #* AC1: Admins should be able to navigate to Users page, open the Add User popup and add a new user.
    #* AC2: users should see a "The email address already exists on the system. " message if any users try to add an existing user email.
    #* AC3: users should see a “This field is required.” warning message when they attempt to add user without any text in Full Name field.
    #* AC3: users should see a “Please enter a valid fullname.” warning message when they do not provide firstname and surname 

    #TODO: Analyze the user story and create acceptance criteria yourself!


    #TODO: Create scenarios that cover all the acceptance criteria
    Background:
        Given user is already on the login page
        And user logs in as "Admin"
        
    Scenario: Verify users can navigates to the Users page and all the fields are enabled
        When user navigates to "Users" page
        And user clicks the Add user button
        Then user is able to see Add User popup
        And all the field are enabled in the Add User popup

    Scenario: Verify users can see a “This field is required.” warning message when they attempt to add user without any text in Full Name field.

        When user navigates to "Users" page
        And user clicks the Add user button
        And user tries to save without a text in the fullname input
        Then user can see a “This field is required.” warning message 

        Scenario: Verify users can save with valid firstname and surname
        When user navigates to "Users" page
        And user clicks the Add user button
        And user tries to save with firstname and surname in the fullname input
        Then user can save the user
        And user can see "the user added successfully" message

        Scenario: Verify users cannot save with invalid fullname and can see "Please enter a valid fullname" message
        When user navigates to "Users" page
        And user clicks the Add user button
        And user tries to save with invalid firstname and surname in the fullname input
        Then user cannot save the user
        And user can see "Please enter a valid fullname" message


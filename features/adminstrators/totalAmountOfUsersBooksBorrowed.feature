Feature: Total Amount of Users, Books, and Borrowed Books

    As an admin, I want to see the total amount of users, books, and borrowed books on the "Dashboard" page. 

    #* AC1: Admin should see the total number of users and the “Users” text. 
    #* AC2: Admin should see the total number of books and the “Books” text. 
    #* AC3: Admin should see the total number of borrowed books and the “Borrowed Books” text. 

    
Background:
        Given user is already on the login page
        And user logs in as "Admin"

    # TODO: Verify admins see the total number of users and the “Users” text.
    Scenario: Verify users can navigates to the Users page and all the fields are enabled
        Then user is on the "Dashbooard" page
        And user is able to see the total number of users and the “Users” text.

    # TODO: Verify admins see the total number of books and the “Books” text.
     Scenario: Verify users can navigates to the Users page and all the fields are enabled
        Then user is on the "Dashbooard" page
        And user is able to see the total number of books and the “Books” text. 
    
    # TODO: Verify admins see the total number of borrowed books and the “Borrowed Books” text.
      Scenario: Verify users can navigates to the Users page and all the fields are enabled
        Then user is on the "Dashbooard" page
        And user is able to see the total number of borrowed books and the “Borrowed Books” text.
    
    #? Should there be more scenarios for this user story? Feel free to add more scenarios.
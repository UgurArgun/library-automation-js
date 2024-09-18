@lib-08
Feature: Return Books Functionality

    As a student, I should be able to return the borrowed books on the "Borrowing Books" page.

    #* AC1: The Return Book button is displayed in the borrwing books page
    #* AC2: The Return Book button should be disabled after user clicks it
    #* AC3: The Return Book button should be enabled for the books that the student can return
    #* AC4: The books student returned should be displayed in the Books page

    Background:
        Given user is already on the login page
        And user logs in to the home page
        And user navigates to the "Borrowing Books" page

# TODO: Verify that the Return Book Button is displayed on the Books page
    Scenario: The Return Book button is displayed on the Books page    
        When user is on the "Borrowing Books" page
        Then user can see that Return Book button is displayed in the books page

# TODO: Verify that the Return Book button is disabled if the book is already borrowed by a student
    Scenario: The Return Book button is displayed if the book is already borrowed by a student    
        When the book is already borrowed by a student
        Then the Return Book button is disabled

# TODO: Verify that the Return Book button is enabled if the book is not returned yet
    Scenario: the Return Book button is enabled if the book is not returned yet
        When the book is already not borrowed yet by a student
        Then the Borrow Book button is enabled

# TODO: Verify that the book under the Is Returned column is displayed as RETURNED once the student returns the book
    Scenario: the book under the Is Returned column is displayed as RETURNED once the student returns the book
        When the student once returns the book
        Then the the status of the book is displayed as returned in the Is Returned column

# TODO: Verify that the book is displayed in the Books page after the student clicks the Return Book button
    Scenario: the book is displayed in the Books page after the student click the Return Book button
        When the user clicks the Return Book button
        And the user navigates to the Books page
        Then the book is displayed in the Books page

#TODO: Feel free to add more...
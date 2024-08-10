@lib-06
Feature: Borrowing books

    As a student, I should be able to borrow books on the "Books" Page.

    #* AC1: The Borrow Book button is displayed in the books page
    #* AC2: The Borrow Book button should be disabled after user clicks it
    #* AC3: The Borrow Book button should be enabled for the books that the student can borrow
    #* AC4: The books student borrowed should be displayed in the Borrowing Books page

    Background:
        Given user is already on the login page
        And user logs in to the home page
        And user navigates to the "Books" page

# TODO: Verify that the Borrow Book Button is displayed on the Books page
    Scenario: The Borrow Book button is displayed on the Books page    
        When user is on the "Books" page
        Then user can see that Borrow Book button is displayed in the books page

# TODO: Verify that the Borrow Book button is disabled if the book is already borrowed by a student
    Scenario: The Borrow Book button is displayed if the book is already borrowed by a student    
        When the book is already borrowed by a student
        Then the Borrow Book button is disabled

# TODO: Verify that the Borrow Book button is enabled if the book is not borrowed by a student yet
    Scenario: the Borrow Book button is enabled if the book is not borrowed by a student yet
        When the book is already not borrowed yet by a student
        Then the Borrow Book button is enabled

# TODO: Verify that the name of the student is displayed in the Borrowed By column once the student borrows the book
    Scenario: the name of the student is displayed in the Borrowed By column once the student
        When the student once borrows the book
        Then the name of the student is displayed in the Borrowed column

# TODO: Verify that the book is displayed in the Borrowing Books page after the student clicks the Borrow Book button
    Scenario: the book is displayed in the Borrowing Books page after the student click the Borrow Book button
        When the user clicks the Borrow Book button
        And the user navigates to the Borrowing Book page
        Then the book is displayed in the Borrowing Books page

#TODO: Fell free to add more...
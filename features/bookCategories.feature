Feature: Book Categories

    As a user, I want to see 21 book categories, so I can filter my favorite books.

    #* AC1: users should see 21 book categories When users click the Book Categories drop down
    #*      ALL, Action and Adventure, Anthology, Classic, Comic and Graphic Novel, Crime and Detective, Drama
    #*      , Fable, Fairy Tale, Fan-Fiction, Fantasy, Historical Fiction, Horror, Science Fiction, Humor
    #*      , Biography/Autobiography ,Romance, Short Story, Essay, Memoir, Poetry, Thrillers, Young adults


    # TODO: verify users see 21 book categories
    Background:
        Given user is already on the login page
    @lib-03-01
    Scenario Outline: Verify that user sees 21 book categories for "<user-type>"
        And user is already logged in as "<user-type>"
        When user clicks Books link
        And user clicks the book categories drop down box
        Then user should see 21 book categories
        Examples:
            | user-type |
            | admin     |
            | student   |

    # TODO: verify that all 21 book categories are displayed under the Book Categories dropdown
    @lib-03-02
    Scenario Outline: Verify that user sees 21 book categories for admin
        And user is already logged in as "<user-type>"
        When user clicks Books link
        And user clicks the book categories drop down box
        Then book category name "<category>" should be included in the categories
        Examples:
            | user-type | category                |
            | admin     | ALL                     |
            | admin     | Action and Adventure    |
            | admin     | Anthology               |
            | admin     | Classic                 |
            | admin     | Comic and Graphic Novel |
            | admin     | Crime and Detective     |
            | admin     | Drama                   |
            | admin     | Fable                   |
            | admin     | Fairy Tale              |
            | admin     | Fan-Fiction             |
            | admin     | Fantasy                 |
            | admin     | Historical Fiction      |
            | admin     | Horror                  |
            | admin     | Science Fiction         |
            | admin     | Biography/Autobiography |
            | admin     | Humor                   |
            | admin     | Romance                 |
            | admin     | Short Story             |
            | admin     | Essay                   |
            | admin     | Memoir                  |
            | admin     | Poetry                  |
            | student   | ALL                     |
            | student   | Action and Adventure    |
            | student   | Anthology               |
            | student   | Classic                 |
            | student   | Comic and Graphic Novel |
            | student   | Crime and Detective     |
            | student   | Drama                   |
            | student   | Fable                   |
            | student   | Fairy Tale              |
            | student   | Fan-Fiction             |
            | student   | Fantasy                 |
            | student   | Historical Fiction      |
            | student   | Horror                  |
            | student   | Science Fiction         |
            | student   | Biography/Autobiography |
            | student   | Humor                   |
            | student   | Romance                 |
            | student   | Short Story             |
            | student   | Essay                   |
            | student   | Memoir                  |
            | student   | Poetry                  |
          
    # TODO: Verify users are able to select record numbers for seeing the filter their favorite books
    @lib-03-03
    Scenario Outline: Verify users are able to select record numbers for seeing the filter their favorite books
        And user is already logged in as "<user-type>"
        When user clicks Books link
        And user clicks to number dropdown of the show records
        When user selects the "<record number>"
        Then it shows that there are "<record number>"
        And it displays the filtered book numbers correctly for "<record number>"
        Examples:
            | user-type | record number |
            | admin     | 5             |
            | admin     | 10            |
            | admin     | 15            |
            | admin     | 50            |
            | admin     | 100           |
            | admin     | 200           |
            | admin     | 500           |
            | student   | 5             |
            | student   | 10            |
            | student   | 15            |
            | student   | 50            |
            | student   | 100           |
            | student   | 200           |
            | student   | 500           |


    # TODO: Verify users are able to filter their favorite books
       
    @lib-03-04
    Scenario Outline: Verify users are able to filter their favorite books
        When user is already logged in as "student"
        And user clicks Books link
        And user clicks the book categories drop down box
        And selects the "<favorite book>" category
        Then it displays the favorite books under the Category column
        And it displays the filtered book category in the dropdown menu
      #  And it displays the filtered book numbers correctly

        Examples:
            | favorite book           |
            | ALL                     |
            | Action and Adventure    |
            | Anthology               |
            | Classic                 |
            | Comic and Graphic Novel |
            | Crime and Detective     |
            | Drama                   |
            | Fable                   |
            | Fairy Tale              |
            | Fan-Fiction             |
            | Fantasy                 |
            | Historical Fiction      |
            | Horror                  |
            | Science Fiction         |
            | Humor                   |
            | Biography/Autobiography |
            | Romance                 |
            | Short Story             |
            | Essay                   |
            | Memoir                  |
            | Poetry                  |
         

    Scenario: Verify users can see all filtered pages
        When user clicks the book categories drop down box
        And clicks the page numbers at the bottom of the page
        Then it displays the relevant pages with correct numbers
        And it displays only the filtered books

    Scenario Outline: Verify users are able to filter their favorite books by sorting
        When user clicks to book categories dropdown menu
        And selects the "<favorite book>" category
        And clicks the sorting button of main "<fields>" in ASC order
        Then it displays the favorite books in ASC order by relevant fields
            | favorite book           | fields      |
            | ALL                     | ISBN        |
            | Action and Adventure    | Name        |
            | Anthology               | Author      |
            | Classic                 | Category    |
            | Comic and Graphic Novel | Year        |
            | Crime and Detective     | Borrowed By |
            | Drama                   | ISBN        |
            | Fable                   | Name        |
            | Fairy Tale              | Author      |
            | Fan-Fiction             | Category    |
            | Fantasy                 | Year        |
            | Historical Fiction      | Borrowed By |
            | Horror                  | ISBN        |
            | Science Fiction         | Name        |


    Scenario Outline: Verify users are able to find favorite book(s) by searching for Name or Author
        When user enters the "<keyword>" to search inputbox
        Then it displays the searched items

        Examples:
            | keyword |
            | The     |
            | Golden  |
            | q       |
            | 35      |
            | P       |
            | Pam     |
            | Pamela  |
            | Dr      |
            | VI      |
            | Ms      |




#? Should there be more scenarios for this user story? Feel free to add more scenarios.
        
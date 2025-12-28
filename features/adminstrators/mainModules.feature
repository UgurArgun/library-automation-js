Feature: Main Modules of the Application

    As an admin, I want to access the main modules of the app.


    #* AC: Admin users should see 3 modules: Dashboard, Users, Books

  
    # TODO: Verify admins can see 3 main modules (Dashboard, Users, and Books)
    Background:
        Given user is already on the home page

    Scenario Outline: Verify admin users 3 main modules (Dashboard, Users, and Books) 
        When Admin user navigates to "module" page
        Then user is able to access to "module" page and see page details 
        Examples:
            | module | 
            | Dashboard |
            | Users |
            | Books |

    #? Should there be more scenarios for this user story? Feel free to add more scenarios.
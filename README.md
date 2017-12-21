# SkyCast Weather Application Prototype 

# Usage via Heroku:
    - For easier testing, I will run the seeds file while on Heroku to make a test account available.
        - There will be two test accounts
            1. The user@example.com will have two searches made so that it is possible to observe viewing previous forecasts.
            2. The guest@example.com will not have any searches made so it is possible to view the output when no searches have been made.
    - Normally I would not run the seeds file, but I will do so as this is a prototype application and this is is done
    for convenience.

# Background Information:

- I used ruby 2.3.1 to create this rails application using the ruby version manager .

- I used RSpec and Capybara while writing this application to integrate in behavior driven tests. Go to the spec/ directory to see
my tests (these work in development mode).

- Bootstrap and CSS were used for styling.

- For my database I decided to use PostgreSQL.
    - I divided my schema up into four tables.
        - The first table holds the Users.
        - The second table holds the Searches by users.
            - A foreign key is used to connect this to the user that made it.
        - The third table holds the hourly forecasts.
            - A foreign key is used to connect this to the search that was made (this only occurs if the user is logged in).
        - The fourth table holds the daily forecasts.
            - A foreign key is used to connect this to the search that was made (this only occurs if the user is logged in).    
    - All of the tables have an index on the ID to help speed up a query when filtering for a search ID, or forecast ID,
    or a user ID.

- I used the [Devise gem](https://github.com/plataformatec/devise) to help with user authentication.

- I used the [Gritter gem](https://github.com/RobinBrouwer/gritter) which leverages a jQuery plugin to display notifications.

- Kaminari was used for pagination of search history and the displaying of forecasts.
    - In addition to using Kaminari I used jQuery and JavaScript to implement
    [AJAX based pagination](https://rails.devcamp.com/ruby-gem-walkthroughs/view-template-tools/kaminari-pagination-example)
    - This implementation leverages jQuery, AJAX, and JavaScript to assist with pagination.

- I used the [Chartkick gem](https://github.com/ankane/chartkick) which produces JavaScript based charts


# How to use this in development mode:

- I did not provide my .env file which provides the API keys needed to make the api calls.
- In order to use this you will need to create a file ".env" and just add the follow to it (where x are the API keys)
    - GOOGLE_MAPS_GC_KEY=x
    - DARK_SKY_KEY=x
    
# Demo:
- A running demo of this can be seen [here](https://tt-weather-forecast.herokuapp.com/)

Table Critique is an application used to review and share restaurant reviews with the world!
----------------------------------------------------

How to run this app:
--------------------
Install Instructions
Clone this repo.
Run 'bundle install'
Run 'rake db:migrate' # migrates the tables into the database
Run 'rake db:seed' # migrates seed file containing initial data to test the application with
Run the server with 'rails s' and open localhost:3000 in your browser to access the homepage.
Enjoy!

As a user I can:
----------------
Sign up, sign in and sign out of Table Critique. 
Create a Review
Search by Restaurant
Reviews by Category
Delete a Review
View your own Profile
View Another User's Profile 
Edit your own Reviews
Delete your own Reviews

-----------------------------------------------------
An MVC rails application that uses:

Sqlite database
ActiveRecord
RESTful routes and Nested routes
Sessions
Signup/Login/Logout
Omniauth gems for login via Google
ORM - Object Relational Mapping between Models
belongs_to
has_many
has_many: :through many-to-many
CRUD functionality:
Create
Read
Update
Delete
One class level Active Record Scope methods
Helper methods to protect the views of the current_user. Only authorized users should be allowed to create, update, and delete their own gigs and user profile.
Helper methods and partials to limit logic in views and the controllers
Validations
uniqueness of a user's login attributes
presence and other custom validations to protect from bad or repetetive data being persisted into the database
Flash messages to display validation error messages, and flash success messages to validate successful creation, edits, and deletion of gigs.
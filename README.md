<h1>Table Critique</h1>

<p>Table Critique is an application used to review and share restaurant reviews with the world!
----------------------------------------------------

<h2>Install Instructions</h2>
--------------------
<li>Clone this repo.
<li>Run 'bundle install'
<li>Run 'rake db:migrate' # migrates the tables into the database
<li>Run 'rake db:seed' # migrates seed file containing initial data to test the application with
<li>Run the server with 'rails s' and open localhost:3000 in to access the homepage.
<li>Enjoy!

<h2>As a user I can:</h2>
----------------
<ul>
    <li>Sign up, sign in and sign out of Table Critique. 
    <li>Create a Review
    <li>Search by Restaurant
    <li>Reviews by Category
    <li>Delete a Review
    <li>View your own Profile
    <li>View Another User's Profile 
    <li>Edit your own Reviews
    <li>Delete your own Reviews
</ul>

-----------------------------------------------------
<h2>An MVC rails application that uses:</h2>
<ul>
    <li> Sqlite database
    <li> ActiveRecord
    <li> RESTful routes and Nested routes
    <li> Sessions
    <li> Signup/Login/Logout 
    <li> Omniauth gems for login via Google
    <li> ORM - Object Relational Mapping between Models
        <ol> 
            <li>belongs_to
            <li>has_many
            <li>has_many: :through many-to-many 
        </ol>
    <li> CRUD functionality:
        <ol>
            <li>Create
            <li>Read
            <li>Update
            <li>Delete
        </ol>
    <li> One class level Active Record Scope methods
    <li> Helper methods to protect the views of the current_user. Only authorized users should be allowed to create, update, and delete their own gigs and user profile.
    <li> Helper methods and partials to limit logic in views and the controllers
    <li> Validations
        <ol>
            <li>uniqueness of a user's login attributes
            <li>presence and other custom validations to protect from bad or repetetive data being persisted into the database
        </ol>
    <li> Flash messages to display validation error messages, and flash success messages to validate successful creation, edits, and deletion of gigs. 
</ul>


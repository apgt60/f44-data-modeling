### Brainstorming 

- Username and password
- display name
- recipes
- ingredients
- instructions
- public / private flag for recipes
- grocery lists
- occasions / recipes

### Table Ideas

user - user data
recipe - name, instructions for recipe, public/private
ingredient - global ingredient list
grocery_list - grocery lists of ingredients for users 
occasion - name, grouping of recipes

### Relationships

* one to one
    * 

* one to many
    * user - recipe: Each user can have multiple recipes but a recipe can only have one owner
    * user - grocery_list: Each user can have multiple grocery lists but a grocery list can only have one owner 
    * user - occasion: Each user can have multiple occasions but an occasion belongs to one user.

* many to many
    * recipe - ingredient: Each recipe can have multiple ingredients and ingredients can be part of multiple recipes 
    * occasion - recipe: Each occassion have have multiple recipes and recipes can be part of multiple occasions
    * grocery_list - ingredient: Each grocery list can have multiple ingredients and each ingredient can be part of multiple grocery lists.

### Columns

* user
    * id integer pk increments
	* email varchar(30) unique
	* passhash varchar(250)

* recipe
    * id integer pk increments
	* owner integer *> user.id
	* is_public boolean

* occasion
    * id integer pk increments
	* name varchar(50)
	* owner_id integer *> 
    * user.id

* ingredient
    * id integer pk increments
    * name varchar(50) unique

* grocery_list
    * id integer pk increments
	* name varchar(50)
	* owner_id integer *> user.id

* grocery_list_ingredient
    * id integer pk increments
	* grocery_list_id integer *> grocery_list.id
	* ingredient_id integer *> ingredient.id

* recipe_ingredient
    * id integer pk increments
	* recipe_id integer *> recipe.id
	* ingredient_id integer *> ingredient.id

* occasion_recipe
    * id integer pk increments
	* recipe_id integer *> recipe.id
	* occasion_id integer *> occasion.id

### Create Table Statements
See lab-recipe-app.sql



# README

Hello PETAL team, this is the Pokemon's API application.

Don't forget to create the DB, launch the migrations, seed the DB and launch the server.

Users and authorizations had been added to the application, thanks to devise, pundit and simple_token_authentication gems.
A token is automatically attached to the user once he has been saved on the DB.

5 actions/routes has been created - that you can visit though the Postman app:

- INDEX - Get all the pokemons: http://localhost:3000/api/v1/pokemons

- SHOW - Get a specific pokemon: http://localhost:3000/api/v1/pokemons/1

- CREATE a new pokemon:
  curl -i -X POST \
   -H 'Content-Type: application/json' \
   -H 'X-User-Email: User email' \
   -H 'X-User-Token: User authentication_token' \
   -d '{ "pokemon": { "name": "New pokemon", "generation": "7" } }' \
   http://localhost:3000/api/v1/pokemons

- UPDATE a specific pokemon:
  curl -i -X PATCH \
   -H 'Content-Type: application/json' \
   -H 'X-User-Email: User email' \
   -H 'X-User-Token: User authentication_token' \
   -d '{ "pokemon": { "name": "New name" } }' \
   http://localhost:3000/api/v1/pokemons/1

- DELETE a specific pokemon:
  curl -i -X DELETE \
   -H 'X-User-Email: User email' \
   -H 'X-User-Token: User authentication_token' \
   http://localhost:3000/api/v1/pokemons/1

NB: the CREATE / UPDATE / DELETE actions need an authenticate user (an email and a token have to be added to the request headers).
The UPDATE / DELETE actions can be processed only by the user who created the pokemon.

Let me know if you have any questions!
Have a good day,

Sophia Benmoussa

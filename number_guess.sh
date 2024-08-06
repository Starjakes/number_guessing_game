#!/bin/bash

# Variable to query database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt user for username
echo -e "\nEnter your username:"
read USERNAME

# Get username data
USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
# Get user id
USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# If player is not found
if [[ -z $USERNAME_RESULT ]]
then
  # Greet player
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  # Add player to database
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
  # Get the new user id
  USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  # Retrieve games played and best game
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN users USING(user_id) WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games LEFT JOIN users USING(user_id) WHERE username='$USERNAME'")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Variable to store number of guesses/tries
GUESS_COUNT=0

# Prompt first guess
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

# Loop to prompt user to guess until correct
until [[ $USER_GUESS -eq $SECRET_NUMBER ]]
do
  # Check if guess is valid (an integer)
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    # Request valid guess
    echo -e "\nThat is not an integer, guess again:"
  else
    # Check inequalities and give hint
    if [[ $USER_GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi
  fi
  read USER_GUESS
  # Update guess count accurately
  ((GUESS_COUNT++))
done

# Loop ends when guess is correct, so update guess
((GUESS_COUNT++))

# Get user id
USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# Add result to game history/database
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES ($USER_ID_RESULT, $SECRET_NUMBER, $GUESS_COUNT)")

# Winning message to the guess
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

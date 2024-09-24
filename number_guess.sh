#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

DISPLAY(){
  echo "Enter your username:"
  read USERNAME

  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

  if [[ -z $USER_ID ]]
  then
    echo Welcome, $USERNAME! It looks like this is your first time here.
    NEW_RESULT_INSERT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = $USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID")

    if [[ $GAMES_PLAYED -eq 0 ]]
    then
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games.
    else
      echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
    fi
  fi

  NUMBER_GENERATOR
}

NUMBER_GENERATOR(){
  RANDOM_NUM=$((1 + $RANDOM % 1000))
  echo -e "\nGuess the secret number between 1 and 1000:"
  read USER_GUESS
  NUMBER_OF_GUESSES=0
  
  while true
  do
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      read USER_GUESS 
      continue
    fi

    ((NUMBER_OF_GUESSES++))

    if [[ $USER_GUESS -gt $RANDOM_NUM ]]
    then

      echo -e "\nIt's lower than that, guess again:"
      read USER_GUESS
    
    elif [[ $USER_GUESS -lt $RANDOM_NUM ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      read USER_GUESS

    else
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUM. Nice job!"
      break
    fi
    
  done
  
  GAME_RESULT_INSERT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")

}

DISPLAY
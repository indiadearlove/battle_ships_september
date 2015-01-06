Feature: Starting the game
  In order to play battleships
  As a two player game
  I need a second player

  Scenario: Registering Player 2
    Given I am ready to register and player one is entered
    When I input Tom
    Then I should say "Hello, Tom! You are player 2"
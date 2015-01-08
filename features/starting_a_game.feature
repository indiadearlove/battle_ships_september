Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Visiting_homepage
		Given I am on the homepage
		When I follow "New Game"
		Then I should see "What's your name?"
		

	Scenario: Registering player 1
		Given I am ready to register
		When I input James
		Then I should get "Player 1: James"

	Scenario: Registering player 2
		Given player 1 has registered
		When I input Tom
		Then I should get "Player 1: Tom"

	Scenario: Not entering name
		Given I am ready to register
		When nothing is inputted
		Then it should read "What's your name?"
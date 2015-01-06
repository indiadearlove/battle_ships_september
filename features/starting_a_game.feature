Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Visiting_homepage
		Given I am on the homepage
		When I follow "New Game"
		Then I should see "What's your name?"
		

	Scenario: Registering
		Given I am ready to register
		When I input James
		Then I should get "Hello, James!"
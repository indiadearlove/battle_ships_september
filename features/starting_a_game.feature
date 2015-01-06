Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Registering
		Given I am on the homepage
		When I follow "New Game"
		Then I should see "What's your name?"
		Then I should be able to input "James"
		Then I should see "Hello James"

	# Scenario: Entering_name
	# 	Given I am on new_game page
	# 	When I input "James"
	# 	Then I should see "Hello James"
Feature: Placing player 1's ships
  As player 1
  In order to place the ship
  I need to give the coordinates and orientation

  Scenario: Placing aircraft carrier
    Given I am ready to start the game
    When I input coordinates A1 and click vertical
    Then I should see "Aircraft carrier placed"
    Then I should see "Place player 2 ships"
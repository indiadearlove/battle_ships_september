Feature: Placing player 2's ships
  As player 2
  In order to place the ship
  I need to give the coordinates and orientation

  Scenario: Placing aircraft carrier
    Given player 1 has placed their ships
    When I input coordinates B1 and click vertical
    Then I should see "Aircraft carrier placed"
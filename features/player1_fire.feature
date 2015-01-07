Feature: Player 1 fires
  As player 1
  In order to shoot at player 2
  I need to give the coordinates

  Scenario: Placing aircraft carrier
    Given I am ready to take my first shoot
    When I input coordinates C4 and click FIRE!
    Then I should see "Miss"
    Then I should see "Player 2's turn"
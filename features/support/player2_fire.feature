Feature: Player 2 fires
  As player 2
  In order to shoot at player 1
  I need to give the coordinates

  Scenario: Firing at player 2
    Given I am ready to take my first shoot
    When I input coordinates C4 and click FIRE!
    Then I should see "Miss"
    Then I should see "Player 2's turn"
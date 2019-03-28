Feature: cardslib should have a deck
  In order to play a game, the cardslib should have a deck
  that is correctly set

  Scenario: deck available
    Given the library is loaded
    And the deck has been shuffled
    Then I should be able to access a deck of 52 cards

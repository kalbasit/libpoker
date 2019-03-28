Feature: A poker game should have a type
  When I say type, I mean 'Texas holdem', 'Omaha'
  'Seven and stud', 'Five card draw' and 'Caribbean stud poker'

  Scenario Outline:
    Given the library is loaded
    And a <poker type> poker game has been started
    Then I should be able to access the deck

  Scenarios: poker types
      | poker type           |
      | Texas holdem         |
      | Omaha                |
      | Seven and stud       |
      | Five card draw       |
      | Caribbean stud poker |

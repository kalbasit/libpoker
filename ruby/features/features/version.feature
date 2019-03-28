Feature: cardslib should have a version
  In order to determine the version of the library
  A user can invoke TechnoGate::Cardslib::Version.new

  Scenario: version available
    Given the library is loaded
    When I try to get the version
    Then I should be able to get the version
    And I should be able to get the major version
    And I should be able to get the minor version
    And I should be able to get the patch version

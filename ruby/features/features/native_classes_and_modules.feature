Feature: The native extension should define modules and classes

  Scenario Outline: native
    Given the native library is loaded
    When I try to check for <name>
    Then I should find it of class <type>
    And the superclass is <superclass>

  Scenarios: classes
    | name                                | type   | superclass                  |
    | TechnoGate::Cardslib::Cards         | Class  | Object                      |
    | TechnoGate::Cardslib::Card          | Class  | Object                      |
    | TechnoGate::Cardslib::Poker::Common | Class  | TechnoGate::Cardslib::Cards |

  Scenarios: modules
    | name                        | type   |
    | TechnoGate::Cardslib::Poker | Module |

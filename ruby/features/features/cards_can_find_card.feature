Feature: Find card
  The find card is a very important features, it allows you to find the integer
  value of the card inside the deck (which allows you to get the index as well)

  For example, calling ace_of_heart on the Cards instance would return the instance
  of the card that correspond with the ace_of_heart, this instance respond to :to_s,
  :to_i and :pretty_print to get a different representation of the card.

  card = @cards.ace_of_heart

  card.to_s             #=> "Ah"
  card.to_i             #=> 268446761
  card.pretty_print     #=> A♥

  Scenario Outline: card_integer
    Given the library is loaded
    And the deck has been shuffled
    When I try to find the card <rank> of <suit>
    And I call to_i on the card
    Then I should get <value>

  Scenarios: card_integer
    | rank  | suit     | value     |
    | ace   | heart    | 268446761 |
    | ace   | hearts   | 268446761 |
    | ace   | club     | 268471337 |
    | ace   | clubs    | 268471337 |
    | ace   | diamond  | 268454953 |
    | ace   | diamonds | 268454953 |
    | ace   | spade    | 268442665 |
    | ace   | spades   | 268442665 |
    | king  | heart    | 134228773 |
    | king  | hearts   | 134228773 |
    | king  | club     | 134253349 |
    | king  | clubs    | 134253349 |
    | king  | diamond  | 134236965 |
    | king  | diamonds | 134236965 |
    | king  | spade    | 134224677 |
    | king  | spades   | 134224677 |
    | queen | heart    | 67119647  |
    | queen | hearts   | 67119647  |
    | queen | club     | 67144223  |
    | queen | clubs    | 67144223  |
    | queen | diamond  | 67127839  |
    | queen | diamonds | 67127839  |
    | queen | spade    | 67115551  |
    | queen | spades   | 67115551  |
    | jack  | heart    | 33564957  |
    | jack  | hearts   | 33564957  |
    | jack  | club     | 33589533  |
    | jack  | clubs    | 33589533  |
    | jack  | diamond  | 33573149  |
    | jack  | diamonds | 33573149  |
    | jack  | spade    | 33560861  |
    | jack  | spades   | 33560861  |
    | ten   | heart    | 16787479  |
    | ten   | hearts   | 16787479  |
    | ten   | club     | 16812055  |
    | ten   | clubs    | 16812055  |
    | ten   | diamond  | 16795671  |
    | ten   | diamonds | 16795671  |
    | ten   | spade    | 16783383  |
    | ten   | spades   | 16783383  |
    | nine  | heart    | 8398611   |
    | nine  | hearts   | 8398611   |
    | nine  | club     | 8423187   |
    | nine  | clubs    | 8423187   |
    | nine  | diamond  | 8406803   |
    | nine  | diamonds | 8406803   |
    | nine  | spade    | 8394515   |
    | nine  | spades   | 8394515   |
    | eight | heart    | 4204049   |
    | eight | hearts   | 4204049   |
    | eight | club     | 4228625   |
    | eight | clubs    | 4228625   |
    | eight | diamond  | 4212241   |
    | eight | diamonds | 4212241   |
    | eight | spade    | 4199953   |
    | eight | spades   | 4199953   |
    | seven | heart    | 2106637   |
    | seven | hearts   | 2106637   |
    | seven | club     | 2131213   |
    | seven | clubs    | 2131213   |
    | seven | diamond  | 2114829   |
    | seven | diamonds | 2114829   |
    | seven | spade    | 2102541   |
    | seven | spades   | 2102541   |
    | six   | heart    | 1057803   |
    | six   | hearts   | 1057803   |
    | six   | club     | 1082379   |
    | six   | clubs    | 1082379   |
    | six   | diamond  | 1065995   |
    | six   | diamonds | 1065995   |
    | six   | spade    | 1053707   |
    | six   | spades   | 1053707   |
    | five  | heart    | 533255    |
    | five  | hearts   | 533255    |
    | five  | club     | 557831    |
    | five  | clubs    | 557831    |
    | five  | diamond  | 541447    |
    | five  | diamonds | 541447    |
    | five  | spade    | 529159    |
    | five  | spades   | 529159    |
    | four  | heart    | 270853    |
    | four  | hearts   | 270853    |
    | four  | club     | 295429    |
    | four  | clubs    | 295429    |
    | four  | diamond  | 279045    |
    | four  | diamonds | 279045    |
    | four  | spade    | 266757    |
    | four  | spades   | 266757    |
    | trey  | heart    | 139523    |
    | trey  | hearts   | 139523    |
    | trey  | club     | 164099    |
    | trey  | clubs    | 164099    |
    | trey  | diamond  | 147715    |
    | trey  | diamonds | 147715    |
    | trey  | spade    | 135427    |
    | trey  | spades   | 135427    |
    | deuce | heart    | 73730     |
    | deuce | hearts   | 73730     |
    | deuce | club     | 98306     |
    | deuce | clubs    | 98306     |
    | deuce | diamond  | 81922     |
    | deuce | diamonds | 81922     |
    | deuce | spade    | 69634     |
    | deuce | spades   | 69634     |

  Scenario Outline: card_string
    Given the library is loaded
    And the deck has been shuffled
    When I try to find the card <rank> of <suit>
    And I call to_s on the card
    Then I should get <value>

  Scenarios: card_string
    | rank  | suit     | value |
    | ace   | heart    | Ah |
    | ace   | hearts   | Ah |
    | ace   | club     | Ac |
    | ace   | clubs    | Ac |
    | ace   | diamond  | Ad |
    | ace   | diamonds | Ad |
    | ace   | spade    | As |
    | ace   | spades   | As |
    | king  | heart    | Kh |
    | king  | hearts   | Kh |
    | king  | club     | Kc |
    | king  | clubs    | Kc |
    | king  | diamond  | Kd |
    | king  | diamonds | Kd |
    | king  | spade    | Ks |
    | king  | spades   | Ks |
    | queen | heart    | Qh |
    | queen | hearts   | Qh |
    | queen | club     | Qc |
    | queen | clubs    | Qc |
    | queen | diamond  | Qd |
    | queen | diamonds | Qd |
    | queen | spade    | Qs |
    | queen | spades   | Qs |
    | jack  | heart    | Jh |
    | jack  | hearts   | Jh |
    | jack  | club     | Jc |
    | jack  | clubs    | Jc |
    | jack  | diamond  | Jd |
    | jack  | diamonds | Jd |
    | jack  | spade    | Js |
    | jack  | spades   | Js |
    | ten   | heart    | Th |
    | ten   | hearts   | Th |
    | ten   | club     | Tc |
    | ten   | clubs    | Tc |
    | ten   | diamond  | Td |
    | ten   | diamonds | Td |
    | ten   | spade    | Ts |
    | ten   | spades   | Ts |
    | nine  | heart    | 9h |
    | nine  | hearts   | 9h |
    | nine  | club     | 9c |
    | nine  | clubs    | 9c |
    | nine  | diamond  | 9d |
    | nine  | diamonds | 9d |
    | nine  | spade    | 9s |
    | nine  | spades   | 9s |
    | eight | heart    | 8h |
    | eight | hearts   | 8h |
    | eight | club     | 8c |
    | eight | clubs    | 8c |
    | eight | diamond  | 8d |
    | eight | diamonds | 8d |
    | eight | spade    | 8s |
    | eight | spades   | 8s |
    | seven | heart    | 7h |
    | seven | hearts   | 7h |
    | seven | club     | 7c |
    | seven | clubs    | 7c |
    | seven | diamond  | 7d |
    | seven | diamonds | 7d |
    | seven | spade    | 7s |
    | seven | spades   | 7s |
    | six   | heart    | 6h |
    | six   | hearts   | 6h |
    | six   | club     | 6c |
    | six   | clubs    | 6c |
    | six   | diamond  | 6d |
    | six   | diamonds | 6d |
    | six   | spade    | 6s |
    | six   | spades   | 6s |
    | five  | heart    | 5h |
    | five  | hearts   | 5h |
    | five  | club     | 5c |
    | five  | clubs    | 5c |
    | five  | diamond  | 5d |
    | five  | diamonds | 5d |
    | five  | spade    | 5s |
    | five  | spades   | 5s |
    | four  | heart    | 4h |
    | four  | hearts   | 4h |
    | four  | club     | 4c |
    | four  | clubs    | 4c |
    | four  | diamond  | 4d |
    | four  | diamonds | 4d |
    | four  | spade    | 4s |
    | four  | spades   | 4s |
    | trey  | heart    | 3h |
    | trey  | hearts   | 3h |
    | trey  | club     | 3c |
    | trey  | clubs    | 3c |
    | trey  | diamond  | 3d |
    | trey  | diamonds | 3d |
    | trey  | spade    | 3s |
    | trey  | spades   | 3s |
    | deuce | heart    | 2h |
    | deuce | hearts   | 2h |
    | deuce | club     | 2c |
    | deuce | clubs    | 2c |
    | deuce | diamond  | 2d |
    | deuce | diamonds | 2d |
    | deuce | spade    | 2s |
    | deuce | spades   | 2s |

  Scenario Outline: card_pretty_print
    Given the library is loaded
    And the deck has been shuffled
    When I try to find the card <rank> of <suit>
    And I call pretty_print on the card
    Then I should get <value>

  Scenarios: card_pretty_print
    | rank  | suit     | value |
    | ace   | heart    | A♥ |
    | ace   | hearts   | A♥ |
    | ace   | club     | A♣ |
    | ace   | clubs    | A♣ |
    | ace   | diamond  | A♦ |
    | ace   | diamonds | A♦ |
    | ace   | spade    | A♠ |
    | ace   | spades   | A♠ |
    | king  | heart    | K♥ |
    | king  | hearts   | K♥ |
    | king  | club     | K♣ |
    | king  | clubs    | K♣ |
    | king  | diamond  | K♦ |
    | king  | diamonds | K♦ |
    | king  | spade    | K♠ |
    | king  | spades   | K♠ |
    | queen | heart    | Q♥ |
    | queen | hearts   | Q♥ |
    | queen | club     | Q♣ |
    | queen | clubs    | Q♣ |
    | queen | diamond  | Q♦ |
    | queen | diamonds | Q♦ |
    | queen | spade    | Q♠ |
    | queen | spades   | Q♠ |
    | jack  | heart    | J♥ |
    | jack  | hearts   | J♥ |
    | jack  | club     | J♣ |
    | jack  | clubs    | J♣ |
    | jack  | diamond  | J♦ |
    | jack  | diamonds | J♦ |
    | jack  | spade    | J♠ |
    | jack  | spades   | J♠ |
    | ten   | heart    | T♥ |
    | ten   | hearts   | T♥ |
    | ten   | club     | T♣ |
    | ten   | clubs    | T♣ |
    | ten   | diamond  | T♦ |
    | ten   | diamonds | T♦ |
    | ten   | spade    | T♠ |
    | ten   | spades   | T♠ |
    | nine  | heart    | 9♥ |
    | nine  | hearts   | 9♥ |
    | nine  | club     | 9♣ |
    | nine  | clubs    | 9♣ |
    | nine  | diamond  | 9♦ |
    | nine  | diamonds | 9♦ |
    | nine  | spade    | 9♠ |
    | nine  | spades   | 9♠ |
    | eight | heart    | 8♥ |
    | eight | hearts   | 8♥ |
    | eight | club     | 8♣ |
    | eight | clubs    | 8♣ |
    | eight | diamond  | 8♦ |
    | eight | diamonds | 8♦ |
    | eight | spade    | 8♠ |
    | eight | spades   | 8♠ |
    | seven | heart    | 7♥ |
    | seven | hearts   | 7♥ |
    | seven | club     | 7♣ |
    | seven | clubs    | 7♣ |
    | seven | diamond  | 7♦ |
    | seven | diamonds | 7♦ |
    | seven | spade    | 7♠ |
    | seven | spades   | 7♠ |
    | six   | heart    | 6♥ |
    | six   | hearts   | 6♥ |
    | six   | club     | 6♣ |
    | six   | clubs    | 6♣ |
    | six   | diamond  | 6♦ |
    | six   | diamonds | 6♦ |
    | six   | spade    | 6♠ |
    | six   | spades   | 6♠ |
    | five  | heart    | 5♥ |
    | five  | hearts   | 5♥ |
    | five  | club     | 5♣ |
    | five  | clubs    | 5♣ |
    | five  | diamond  | 5♦ |
    | five  | diamonds | 5♦ |
    | five  | spade    | 5♠ |
    | five  | spades   | 5♠ |
    | four  | heart    | 4♥ |
    | four  | hearts   | 4♥ |
    | four  | club     | 4♣ |
    | four  | clubs    | 4♣ |
    | four  | diamond  | 4♦ |
    | four  | diamonds | 4♦ |
    | four  | spade    | 4♠ |
    | four  | spades   | 4♠ |
    | trey  | heart    | 3♥ |
    | trey  | hearts   | 3♥ |
    | trey  | club     | 3♣ |
    | trey  | clubs    | 3♣ |
    | trey  | diamond  | 3♦ |
    | trey  | diamonds | 3♦ |
    | trey  | spade    | 3♠ |
    | trey  | spades   | 3♠ |
    | deuce | heart    | 2♥ |
    | deuce | hearts   | 2♥ |
    | deuce | club     | 2♣ |
    | deuce | clubs    | 2♣ |
    | deuce | diamond  | 2♦ |
    | deuce | diamonds | 2♦ |
    | deuce | spade    | 2♠ |
    | deuce | spades   | 2♠ |

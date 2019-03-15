Feature: identify card
  A card that is represented by an integer, when I can identify_card on it
  it should return the string representation of the card

  Scenario Outline: identify_card
    Given the library is loaded
    And the deck has been shuffled
    When I call identify_card on <card>
    Then I should get <value>

  Scenarios: identify_card
    | card       | value |
    | 139523     | 3h    |
    | 98306      | 2c    |
    | 2131213    | 7c    |
    | 147715     | 3d    |
    | 67119647   | Qh    |
    | 1065995    | 6d    |
    | 8406803    | 9d    |
    | 1082379    | 6c    |
    | 69634      | 2s    |
    | 8398611    | 9h    |
    | 67144223   | Qc    |
    | 4228625    | 8c    |
    | 268454953  | Ad    |
    | 134253349  | Kc    |
    | 2102541    | 7s    |
    | 268471337  | Ac    |
    | 270853     | 4h    |
    | 541447     | 5d    |
    | 135427     | 3s    |
    | 16795671   | Td    |
    | 73730      | 2h    |
    | 2106637    | 7h    |
    | 8423187    | 9c    |
    | 16783383   | Ts    |
    | 4199953    | 8s    |
    | 81922      | 2d    |
    | 67127839   | Qd    |
    | 4204049    | 8h    |
    | 533255     | 5h    |
    | 134236965  | Kd    |
    | 16787479   | Th    |
    | 268446761  | Ah    |
    | 33560861   | Js    |
    | 4212241    | 8d    |
    | 2114829    | 7d    |
    | 8394515    | 9s    |
    | 67115551   | Qs    |
    | 557831     | 5c    |
    | 33564957   | Jh    |
    | 16812055   | Tc    |
    | 134224677  | Ks    |
    | 266757     | 4s    |
    | 268442665  | As    |
    | 164099     | 3c    |
    | 134228773  | Kh    |
    | 529159     | 5s    |
    | 1053707    | 6s    |
    | 33589533   | Jc    |
    | 295429     | 4c    |
    | 279045     | 4d    |
    | 1057803    | 6h    |
    | 33573149   | Jd    |

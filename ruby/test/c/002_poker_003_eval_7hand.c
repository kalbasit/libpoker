/**
 * vim:ft=c:fenc=UTF-8:ts=4:sts=2:sw=2:expandtab
 *
 * Copyright 2010, 2011 TechnoGate <team@technogate.fr>
 *
 * This file is part of Cardslib
 *
 * Cardslib is free software: you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Cardslib is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Cardslib. If not, see http://www.gnu.org/licenses/
 */


#include <stdarg.h>
#include <stddef.h>
#include <stdbool.h>
#include <setjmp.h>
#include <cmockery.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include "includes/cards.h"
#include "includes/poker.h"

static int deck[52];

/**
 * Functions definitions
 */
static void test_straight_flush(void **state);
static void test_four_of_a_kind(void **state);
static void test_full_house(void **state);
static void test_flush(void **state);
static void test_straight(void **state);
static void test_three_of_a_kind(void **state);
static void test_two_pair(void **state);
static void test_one_pair(void **state);
static void test_high_card(void **state);


static void test_straight_flush(void **state)
{
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(KING, HEART, deck)];
  cards[2] = deck[find_card(QUEEN, HEART, deck)];
  cards[3] = deck[find_card(JACK, HEART, deck)];
  cards[4] = deck[find_card(TEN, HEART, deck)];
  cards[5] = deck[find_card(DEUCE, HEART, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result < 10);
}

static void test_four_of_a_kind(void **state)
{
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(ACE, DIAMOND, deck)];
  cards[2] = deck[find_card(ACE, CLUB, deck)];
  cards[3] = deck[find_card(ACE, SPADE, deck)];
  cards[4] = deck[find_card(KING, SPADE, deck)];
  cards[5] = deck[find_card(DEUCE, HEART, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result > 10 && result <= 166);
}

static void test_full_house(void **state) {
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(ACE, DIAMOND, deck)];
  cards[2] = deck[find_card(ACE, CLUB, deck)];
  cards[3] = deck[find_card(JACK, HEART, deck)];
  cards[4] = deck[find_card(JACK, CLUB, deck)];
  cards[5] = deck[find_card(DEUCE, HEART, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result > 166 && result <= 322);
}

static void test_flush(void **state) {
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(QUEEN, HEART, deck)];
  cards[2] = deck[find_card(TEN, HEART, deck)];
  cards[3] = deck[find_card(TREY, HEART, deck)];
  cards[4] = deck[find_card(DEUCE, HEART, deck)];
  cards[5] = deck[find_card(FOUR, DIAMOND, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result > 322 && result <= 1599);
}

static void test_straight(void **state) {
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(KING, CLUB, deck)];
  cards[2] = deck[find_card(QUEEN, DIAMOND, deck)];
  cards[3] = deck[find_card(JACK, HEART, deck)];
  cards[4] = deck[find_card(TEN, SPADE, deck)];
  cards[5] = deck[find_card(DEUCE, HEART, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result > 1599 && result <= 1609);
}

static void test_three_of_a_kind(void **state) {
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(ACE, DIAMOND, deck)];
  cards[2] = deck[find_card(ACE, SPADE, deck)];
  cards[3] = deck[find_card(JACK, HEART, deck)];
  cards[4] = deck[find_card(TEN, HEART, deck)];
  cards[5] = deck[find_card(DEUCE, HEART, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result > 1609 && result <= 2467);
}

static void test_two_pair(void **state) {
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(ACE, CLUB, deck)];
  cards[2] = deck[find_card(QUEEN, HEART, deck)];
  cards[3] = deck[find_card(QUEEN, CLUB, deck)];
  cards[4] = deck[find_card(TEN, HEART, deck)];
  cards[5] = deck[find_card(DEUCE, HEART, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result > 2467 && result <= 3325);
}

static void test_one_pair(void **state) {
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(ACE, CLUB, deck)];
  cards[2] = deck[find_card(QUEEN, HEART, deck)];
  cards[3] = deck[find_card(JACK, DIAMOND, deck)];
  cards[4] = deck[find_card(TEN, HEART, deck)];
  cards[5] = deck[find_card(DEUCE, HEART, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result > 3325 && result <= 6185);
}

static void test_high_card(void **state) {
  int result, cards[7];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(KING, CLUB, deck)];
  cards[2] = deck[find_card(JACK, HEART, deck)];
  cards[3] = deck[find_card(EIGHT, SPADE, deck)];
  cards[4] = deck[find_card(DEUCE, CLUB, deck)];
  cards[5] = deck[find_card(FOUR, HEART, deck)];
  cards[6] = deck[find_card(FIVE, SPADE, deck)];

  result = eval_7hand(cards);
  assert(result > 6185);
}

int main() {
  // seed the random number generator
  srand48( getpid() );

  // Initialize the deck
  init_deck(deck);

  const UnitTest tests[] = {
    unit_test(test_straight_flush),
    unit_test(test_four_of_a_kind),
    unit_test(test_full_house),
    unit_test(test_flush),
    unit_test(test_straight),
    unit_test(test_three_of_a_kind),
    unit_test(test_two_pair),
    unit_test(test_one_pair),
    unit_test(test_high_card),
  };

  return run_tests(tests);
}

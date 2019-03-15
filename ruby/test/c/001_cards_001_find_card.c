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

static int deck[52];

/**
 * Functions definitions
 */
static void test_find_card(void **state);


static void test_find_card(void **state)
{
  int cards[4];

  // Get cards
  cards[0] = deck[find_card(ACE, HEART, deck)];
  cards[1] = deck[find_card(KING, HEART, deck)];
  cards[2] = deck[find_card(QUEEN, HEART, deck)];
  cards[3] = deck[find_card(JACK, HEART, deck)];
  cards[4] = deck[find_card(TEN, HEART, deck)];

  assert_int_equal(cards[0], 268446761);
  assert_int_equal(cards[1], 134228773);
  assert_int_equal(cards[2], 67119647);
  assert_int_equal(cards[3], 33564957);
  assert_int_equal(cards[4], 16787479);
}

int main() {
  // seed the random number generator
  srand48( getpid() );

  // Initialize the deck
  init_deck(deck);

  const UnitTest tests[] = {
    unit_test(test_find_card),
  };

  return run_tests(tests);
}

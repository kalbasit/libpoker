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
#include <stdlib.h>
#include "includes/cards.h"

static int deck[52];

/**
 * Functions definitions
 */
static void test_identify_ace_of_hearts(void **state);
static void test_identify_deuce_of_clubs(void **state);


static void test_identify_ace_of_hearts(void **state)
{
  int card;
  char *result;

  // Allocate memory
  result = (char *) malloc(2 * sizeof(char));

  // Get the card
  card = deck[find_card(ACE, HEART, deck)];

  // Try to identify it
  identify_card(card, result);

  assert_int_equal(strcmp(result, "Ah"), 0);

  // Free allocated memory
  free(result);
}

static void test_identify_deuce_of_clubs(void **state)
{
  int card;
  char *result;

  // Allocate memory
  result = (char *) malloc(2 * sizeof(char));

  // Get the card
  card = deck[find_card(DEUCE, CLUB, deck)];

  // Try to identify it
  identify_card(card, result);

  assert_int_equal(strcmp(result, "2c"), 0);

  // Free allocated memory
  free(result);
}

int main() {
  // seed the random number generator
  srand48( getpid() );

  // Initialize the deck
  init_deck(deck);

  const UnitTest tests[] = {
    unit_test(test_identify_ace_of_hearts),
    unit_test(test_identify_deuce_of_clubs),
  };

  return run_tests(tests);
}

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
static void test_identify_hand_1cards(void **state);
static void test_identify_hand_2cards(void **state);
static void test_identify_hand_3cards(void **state);
static void test_identify_hand_4cards(void **state);
static void test_identify_hand_5cards(void **state);

static void test_identify_hand_1cards(void **state)
{
  int hand[1];
  char *result;

  // Allocate memory
  result = (char *) malloc(2 * sizeof(char));

  // Get hand
  hand[0] = deck[find_card(ACE, HEART, deck)];

  // Try to identify it
  identify_hand(hand, 1, result);

  assert_int_equal(strcmp(result, "Ah"), 0);

  // Free the memory
  free(result);
}

static void test_identify_hand_2cards(void **state)
{
  int hand[2];
  char *result;

  // Allocate memory
  result = (char *) malloc(4 * sizeof(char));

  // Get hand
  hand[0] = deck[find_card(ACE, HEART, deck)];
  hand[1] = deck[find_card(KING, HEART, deck)];

  // Try to identify it
  identify_hand(hand, 2, result);

  assert_int_equal(strcmp(result, "AhKh"), 0);

  // Free the memory
  free(result);
}

static void test_identify_hand_3cards(void **state)
{
  int hand[3];
  char *result;

  // Allocate memory
  result = (char *) malloc(6 * sizeof(char));

  // Get hand
  hand[0] = deck[find_card(ACE, HEART, deck)];
  hand[1] = deck[find_card(KING, HEART, deck)];
  hand[2] = deck[find_card(QUEEN, HEART, deck)];

  // Try to identify it
  identify_hand(hand, 3, result);

  assert_int_equal(strcmp(result, "AhKhQh"), 0);

  // Free the memory
  free(result);
}

static void test_identify_hand_4cards(void **state)
{
  int hand[4];
  char *result;

  // Allocate memory
  result = (char *) malloc(8 * sizeof(char));

  // Get hand
  hand[0] = deck[find_card(ACE, HEART, deck)];
  hand[1] = deck[find_card(KING, HEART, deck)];
  hand[2] = deck[find_card(QUEEN, HEART, deck)];
  hand[3] = deck[find_card(JACK, HEART, deck)];

  // Try to identify it
  identify_hand(hand, 4, result);

  assert_int_equal(strcmp(result, "AhKhQhJh"), 0);

  // Free the memory
  free(result);
}

static void test_identify_hand_5cards(void **state)
{
  int hand[5];
  char *result;

  // Allocate memory
  result = (char *) malloc(10 * sizeof(char));

  // Get hand
  hand[0] = deck[find_card(ACE, HEART, deck)];
  hand[1] = deck[find_card(KING, HEART, deck)];
  hand[2] = deck[find_card(QUEEN, HEART, deck)];
  hand[3] = deck[find_card(JACK, HEART, deck)];
  hand[4] = deck[find_card(TEN, HEART, deck)];

  // Try to identify it
  identify_hand(hand, 5, result);

  assert_int_equal(strcmp(result, "AhKhQhJhTh"), 0);

  // Free the memory
  free(result);
}

int main() {
  // seed the random number generator
  srand48( getpid() );

  // Initialize the deck
  init_deck(deck);

  const UnitTest tests[] = {
    unit_test(test_identify_hand_1cards),
    unit_test(test_identify_hand_2cards),
    unit_test(test_identify_hand_3cards),
    unit_test(test_identify_hand_4cards),
    unit_test(test_identify_hand_5cards),
  };

  return run_tests(tests);
}

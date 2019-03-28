/**
 * vim:ft=c:fenc=UTF-8:ts=2:sts=2:sw=2:expandtab
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


#include <unistd.h>
#include "ruby.h"
#include "cardslib_native.h"
#include "includes/cards.c"
#include "includes/poker.c"
#include "includes/helper.c"

// The initialization method for this module
void
Init_cardslib_native() {
  // Define Cardslib module
  mTechnoGate = rb_define_module("TechnoGate");
  mCardslib   = rb_define_module_under(mTechnoGate, "Cardslib");
  mPoker      = rb_define_module_under(mCardslib, "Poker");
  cCard = rb_define_class_under(mCardslib, "Card", rb_cObject);
  cCards = rb_define_class_under(mCardslib, "Cards", rb_cObject);
  cPokerCommon = rb_define_class_under(mPoker, "Common", cCards);

  // Define Cards (class) variables and functions
  rb_define_const(cCards, "CLUB", INT2FIX(CLUB));
  rb_define_const(cCards, "DIAMOND", INT2FIX(DIAMOND));
  rb_define_const(cCards, "HEART", INT2FIX(HEART));
  rb_define_const(cCards, "SPADE", INT2FIX(SPADE));

  rb_define_const(cCards, "DEUCE", INT2FIX(DEUCE));
  rb_define_const(cCards, "TREY", INT2FIX(TREY));
  rb_define_const(cCards, "FOUR", INT2FIX(FOUR));
  rb_define_const(cCards, "FIVE", INT2FIX(FIVE));
  rb_define_const(cCards, "SIX", INT2FIX(SIX));
  rb_define_const(cCards, "SEVEN", INT2FIX(SEVEN));
  rb_define_const(cCards, "EIGHT", INT2FIX(EIGHT));
  rb_define_const(cCards, "NINE", INT2FIX(NINE));
  rb_define_const(cCards, "TEN", INT2FIX(TEN));
  rb_define_const(cCards, "JACK", INT2FIX(JACK));
  rb_define_const(cCards, "QUEEN", INT2FIX(QUEEN));
  rb_define_const(cCards, "KING", INT2FIX(KING));
  rb_define_const(cCards, "ACE", INT2FIX(ACE));

  rb_define_method(cCards, "init_deck", method_init_deck, 0);
  rb_define_method(cCards, "find_card", method_find_card, 2);
  rb_define_method(cCards, "identify_card", method_identify_card, 1);
  rb_define_method(cCards, "identify_hand", method_identify_hand, 1);

  // Define Poker (class) variables and functions
  rb_define_const(cPokerCommon, "STRAIGHT_FLUSH", INT2FIX(STRAIGHT_FLUSH));
  rb_define_const(cPokerCommon, "FOUR_OF_A_KIND", INT2FIX(FOUR_OF_A_KIND));
  rb_define_const(cPokerCommon, "FULL_HOUSE", INT2FIX(FULL_HOUSE));
  rb_define_const(cPokerCommon, "FLUSH", INT2FIX(FLUSH));
  rb_define_const(cPokerCommon, "STRAIGHT", INT2FIX(STRAIGHT));
  rb_define_const(cPokerCommon, "THREE_OF_A_KIND", INT2FIX(THREE_OF_A_KIND));
  rb_define_const(cPokerCommon, "TWO_PAIR", INT2FIX(TWO_PAIR));
  rb_define_const(cPokerCommon, "ONE_PAIR", INT2FIX(ONE_PAIR));
  rb_define_const(cPokerCommon, "HIGH_CARD", INT2FIX(HIGH_CARD));
  rb_define_const(cPokerCommon, "RANK_NAME", get_rank_names());

  rb_define_method(cPokerCommon, "eval_5hand", method_eval_5hand, 5);
  rb_define_method(cPokerCommon, "eval_6hand", method_eval_6hand, 6);
  rb_define_method(cPokerCommon, "eval_7hand", method_eval_7hand, 7);
  rb_define_method(cPokerCommon, "hand_rank", method_hand_rank, 1);
}

/**
 *
 * call-seq:
 *  init_deck() -> self
 *
 * This function init the deck, @deck is initialized in your class
 */
  VALUE
method_init_deck(VALUE self) {
  int deck[52], i;
  VALUE rDeck, icCard, *card;

  init_deck(deck);

  rDeck = rb_ary_new2(52);

  for(i=0; i < 52 ; i++) {
    // Reserve memory
    card = (VALUE *) malloc(sizeof(VALUE));

    // Send the value of the card in the arguments
    card[0] = INT2FIX(deck[i]);

    // Create a new instance of the card class
    icCard = rb_class_new_instance(1, card, cCard);

    // free the memory
    free(card);

    // Store the object in the array
    rb_ary_store(rDeck, i, icCard);
  }

  // Define the deck variable ruby side
  rb_iv_set(self, "@deck", rDeck);
  return self;
}

/**
 *
 * call-seq:
 *  find_card(rank, suit) -> Integer
 *
 * This function take two integer as argument, the integers are defined as constants
 * and returns an integer, which is the internal value of the card
 */
  VALUE
method_find_card(VALUE self, VALUE rank, VALUE suit) {
  int deck[52], i, result;
  VALUE rDeck;
  VALUE* cDeck;
  char error[255];

  // Get the deck from ruby
  rDeck = rb_iv_get(self, "@deck");

  // Check and verify the deck is given and not Qnil
  if(rDeck == Qnil)
    rb_raise(rb_eException, "rDeck can't be null, please init the deck first");

  // Make sure the size of the deck is 53!!
  if(RARRAY_LEN(rDeck) != 52)
    rb_raise(rb_eException, "The length of rDeck should be exactly 52");

  // Create a C reference of ruby array
  cDeck = RARRAY_PTR( rDeck );

  // Construct the C table out of the rDeck array
  for(i = 0; i < RARRAY_LEN(rDeck); i++) {
    deck[i] = card_value(cDeck[i]);
  }

  // Find the card
  result = find_card(NUM2INT(rank), NUM2INT(suit), deck);

  // Check if find_card were not able to find the index
  if(result == -1)
  {
    sprintf(error, "The rank '%i' and the suit '%i' can't be found", NUM2INT(rank), NUM2INT(suit));
    rb_raise(rb_eArgError, error);
    result = 0;
  }

  return INT2NUM(result);
}

/**
 *
 * call-seq:
 *  identify_card(card) -> String
 *
 * This function takes the integer value of a card and return a 2-char string representing
 * the rank and the suit
 */
  VALUE
method_identify_card(VALUE self, VALUE card) {
  VALUE rResult;
  char *cResult;

  // allocate the memory for the string
  cResult = (char*) malloc(2 * sizeof(char));

  // Identify the card
  identify_card(card_value(card), cResult);

  // Construct the Ruby-String
  rResult = rb_str_new(cResult, 2);

  // Free the allocated memory
  free(cResult);

  return rResult;
}

/**
 *
 * call-seq:
 *  identify_hand(hand) -> String
 *
 * This function takes an array as an argument and returns a String, the string represent the rank
 * and the suit of each card.
 */
  VALUE
method_identify_hand(VALUE self, VALUE rHand) {
  VALUE* cHand;
  int *hand, i;
  char *result;
  VALUE rResult;

  // Allocate enough memory for the array
  hand = (int *) malloc(RARRAY_LEN(rHand) * sizeof(int));
  result = (char *) malloc(2 * RARRAY_LEN(rHand) * sizeof(char));

  // Create a C reference of ruby array
  cHand = RARRAY_PTR(rHand);

  // Construct the C table out of the rHand array
  for(i = 0; i < RARRAY_LEN(rHand); i++) {
    hand[i] = card_value(cHand[i]);
  }

  identify_hand(hand, RARRAY_LEN(rHand), result);

  // Create the ruby Object
  rResult = rb_str_new(result, 2 * RARRAY_LEN(rHand));

  // Free the allocated memory
  free(hand);
  free(result);

  return rResult;
}

/**
 *
 * call-seq:
 *  eval_5hand(c1, c2, c3, c4, c5) -> Integer
 *
 * This function returns the score of 5-cards hand, each cards represented as an integer
 */
  VALUE
method_eval_5hand(VALUE self, VALUE c1, VALUE c2, VALUE c3, VALUE c4, VALUE c5) {
  int result;
  int cards[] = { card_value(c1), card_value(c2), card_value(c3), card_value(c4), card_value(c5) };

  result = eval_5hand(cards);

  return INT2NUM(result);
}

/**
 *
 * call-seq:
 *  eval_6hand(c1, c2, c3, c4, c5, c6) -> Integer
 *
 * This function returns the score of 6-cards hand, each cards represented as an integer
 */
  VALUE
method_eval_6hand(VALUE self, VALUE c1, VALUE c2, VALUE c3, VALUE c4, VALUE c5, VALUE c6) {
  int result;
  int cards[] = { card_value(c1), card_value(c2), card_value(c3), card_value(c4), card_value(c5), card_value(c6) };

  result = eval_6hand(cards);

  return INT2NUM(result);
}

/**
 *
 * call-seq:
 *  eval_7hand(c1, c2, c3, c4, c5, c6, c7) -> Integer
 *
 * This function returns the score of 7-cards hand, each cards represented as an integer
 */
  VALUE
method_eval_7hand(VALUE self, VALUE c1, VALUE c2, VALUE c3, VALUE c4, VALUE c5, VALUE c6, VALUE c7) {
  int result;
  int cards[] = { card_value(c1), card_value(c2), card_value(c3), card_value(c4), card_value(c5), card_value(c6), card_value(c7) };

  result = eval_7hand(cards);

  return INT2NUM(result);
}

/**
 *
 * call-seq:
 *  hand_rank(score) -> Integer
 *
 * This function return the rank of your poker hand, given the score as an Integer
 */
  VALUE
method_hand_rank(VALUE self, VALUE score) {

  return INT2FIX(hand_rank(NUM2INT(score)));
}

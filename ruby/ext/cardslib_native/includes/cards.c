/**
 * vim:ft=c:fenc=UTF-8:ts=2:sts=2:sw=2:expandtab
 *
 * Copyright 2010, 2011 TechnoGate <team@technogate.fr>
 * Copyright 2001 Kevin L. Suffecool <suffecool@bigfoot.com>
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


#include <stdio.h>
#include <stdlib.h>
#include "cards.h"

//
//   Copyright 2001 Kevin L. Suffecool <suffecool@bigfoot.com>
//
//   This routine initializes the deck.  A deck of cards is
//   simply an integer array of length 52 (no jokers).  This
//   array is populated with each card, using the following
//   scheme:
//
//   An integer is made up of four bytes.  The high-order
//   bytes are used to hold the rank bit pattern, whereas
//   the low-order bytes hold the suit/rank/prime value
//   of the card.
//
//   +--------+--------+--------+--------+
//   |xxxbbbbb|bbbbbbbb|cdhsrrrr|xxpppppp|
//   +--------+--------+--------+--------+
//
//   p = prime number of rank (deuce=2,trey=3,four=5,five=7,...,ace=41)
//   r = rank of card (deuce=0,trey=1,four=2,five=3,...,ace=12)
//   cdhs = suit of card
//   b = bit turned on depending on rank of card
//
  void
init_deck( int *deck )
{
  int i, j, n = 0, suit = 0x8000;

  for ( i = 0; i < 4; i++, suit >>= 1 )
    for ( j = 0; j < 13; j++, n++ )
      deck[n] = primes[j] | (j << 8) | suit | (1 << (16+j));
}


//
//  Copyright 2001 Kevin L. Suffecool <suffecool@bigfoot.com>
//
//  This routine will search a deck for a specific card (specified by
//  rank/suit), and return the INDEX giving the position of the found card.  If
//  it is not found, then it returns -1
//
  int
find_card( const int rank, const int suit, const int *deck )
{
  int i, c;

  for ( i = 0; i < 52; i++ )
  {
    c = deck[i];
    if ( (c & suit)  &&  (RANK(c) == rank) )
      return( i );
  }
  return( -1 );
}

// This function is a modified version of print_hand()
//
// Copyright 2001 Kevin L. Suffecool <suffecool@bigfoot.com>
//
  void
identify_card(const int card, char* result)
{
  static const char *rank = "23456789TJQKA";
  int r;
  char suit;

  // Find out the index of the rank
  r = (card >> 8) & 0xF;

  // Find out which suit it is
  if(card & CLUB)
    suit = 'c';
  else if (card & DIAMOND)
    suit = 'd';
  else if (card & HEART)
    suit = 'h';
  else // card & SPADE
    suit = 's';

  // Add the rank and the suit to the result
  result[0] = rank[r];
  result[1] = suit;
}

  void
identify_hand(const int *hand, const int n, char* result)
{
  int i, j = 0;
  char* card;

  // allocate the memory for the string
  card = (char *) malloc(2 * sizeof(char));

  for(i=0; i < n; i++)
  {
    // Identify this card
    identify_card(hand[i], card);

    // Add the card to the result
    result[j++] = card[0];
    result[j++] = card[1];
  }

  // Free card memory
  free(card);
}

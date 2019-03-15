/**
 * vim:ft=c:fenc=UTF-8:ts=2:sts=2:sw=2:expandtab
 *
 * Copyright 2010, 2011 TechnoGate <team@technogate.fr>
 * Copyright 2001 Kevin L. Suffecool, 2001 <suffecool@bigfoot.com>
 * Copyright 2006 Paul D. Senzee. <psenzee@yahoo.com>
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


#ifndef RUBY_CARDSLIB_POKERH
#define RUBY_CARDSLIB_POKERH

#define    STRAIGHT_FLUSH    1
#define    FOUR_OF_A_KIND    2
#define    FULL_HOUSE        3
#define    FLUSH             4
#define    STRAIGHT          5
#define    THREE_OF_A_KIND   6
#define    TWO_PAIR          7
#define    ONE_PAIR          8
#define    HIGH_CARD         9

static const char *value_str[] = {
  "",
  "Straight Flush",
  "Four of a Kind",
  "Full House",
  "Flush",
  "Straight",
  "Three of a Kind",
  "Two Pair",
  "One Pair",
  "High Card"
};

unsigned find_fast(unsigned u);
int hand_rank( short val );
int eval_5cards(int c1, int c2, int c3, int c4, int c5);
short eval_5hand( int *hand );
short eval_6hand( int *hand );
short eval_7hand( int *hand );

#endif

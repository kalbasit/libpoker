/**
 * vim:ft=c:fenc=UTF-8:ts=2:sts=2:sw=2:expandtab
 *
 * Copyright 2010, 2011 TechnoGate <team@technogate.fr>
 * Copyright 2006 Paul D. Senzee. <psenzee@yahoo.com>
 * Copyright 2001 Kevin L. Suffecool, 2001 <suffecool@bigfoot.com>
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


#include "cards.h"
#include "arrays.h"
#include "poker.h"

//
// Copyright 2006 Paul D. Senzee. <psenzee@yahoo.com>
//
  unsigned
find_fast(unsigned u)
{
  unsigned a, b, r;
  u += 0xe91aaa35;
  u ^= u >> 16;
  u += u << 8;
  u ^= u >> 4;
  b  = (u >> 8) & 0x1ff;
  a  = (u + (u << 2)) >> 19;
  r  = a ^ hash_adjust[b];
  return r;
}

  int
hand_rank( short val )
{
  if (val > 6185) return(HIGH_CARD);        // 1277 high card
  if (val > 3325) return(ONE_PAIR);         // 2860 one pair
  if (val > 2467) return(TWO_PAIR);         //  858 two pair
  if (val > 1609) return(THREE_OF_A_KIND);  //  858 three-kind
  if (val > 1599) return(STRAIGHT);         //   10 straights
  if (val > 322)  return(FLUSH);            // 1277 flushes
  if (val > 166)  return(FULL_HOUSE);       //  156 full house
  if (val > 10)   return(FOUR_OF_A_KIND);   //  156 four-kind
  return(STRAIGHT_FLUSH);                   //   10 straight-flushes
}

//
// Copyright 2006 Paul D. Senzee. <psenzee@yahoo.com>
//
// Original Function name: eval_5hand_fast()
//
  int
eval_5cards(int c1, int c2, int c3, int c4, int c5)
{
  int q = (c1 | c2 | c3 | c4 | c5) >> 16;
  short s;
  if (c1 & c2 & c3 & c4 & c5 & 0xf000) return flushes[q]; // check for flushes and straight flushes
  if ((s = unique5[q]))                return s;          // check for straights and high card hands
  return hash_values[find_fast((c1 & 0xff) * (c2 & 0xff) * (c3 & 0xff) * (c4 & 0xff) * (c5 & 0xff))];
}


//
//  Copyright 2001 Kevin L. Suffecool <suffecool@bigfoot.com>
//
  short
eval_5hand( int *hand )
{
  int c1, c2, c3, c4, c5;

  c1 = *hand++;
  c2 = *hand++;
  c3 = *hand++;
  c4 = *hand++;
  c5 = *hand;

  return( eval_5cards(c1,c2,c3,c4,c5) );
}

  short
eval_6hand( int *hand )
{
  int i, j, q, best = 9999, subhand[5];

  for ( i = 0; i < 6; i++ )
  {
    for ( j = 0; j < 5; j++ )
      subhand[j] = hand[ perm6[i][j] ];
    q = eval_5hand( subhand );
    if ( q < best )
      best = q;
  }
  return( best );
}

//
// Copyright 2001 Kevin L. Suffecool <suffecool@bigfoot.com>
//
// This is a non-optimized method of determining the
// best five-card hand possible out of seven cards.
// I am working on a faster algorithm.
//
  short
eval_7hand( int *hand )
{
  int i, j, q, best = 9999, subhand[5];

  for ( i = 0; i < 21; i++ )
  {
    for ( j = 0; j < 5; j++ )
      subhand[j] = hand[ perm7[i][j] ];
    q = eval_5hand( subhand );
    if ( q < best )
      best = q;
  }
  return( best );
}

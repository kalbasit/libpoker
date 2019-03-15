/**
 * vim:ft=c:fenc=UTF-8:ts=2:sts=2:sw=2:expandtab
 *
 * Copyright 2010, 2011 TechnoGate <team@technogate.fr>
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


#ifndef RUBY_CARDSLIB_CARDSH
#define RUBY_CARDSLIB_CARDSH

#define    RANK(x)           ((x >> 8) & 0xF)

#define CLUB    0x8000
#define DIAMOND 0x4000
#define HEART   0x2000
#define SPADE   0x1000

#define DEUCE   0
#define TREY    1
#define FOUR    2
#define FIVE    3
#define SIX     4
#define SEVEN   5
#define EIGHT   6
#define NINE    7
#define TEN     8
#define JACK    9
#define QUEEN   10
#define KING    11
#define ACE     12


/*
 * Copyright 2001 Kevin L. Suffecool, 2001 <suffecool@bigfoot.com>
 *
 ** each of the thirteen card ranks has its own prime number
 **
 ** deuce = 2
 ** trey  = 3
 ** four  = 5
 ** five  = 7
 ** ...
 ** king  = 37
 ** ace   = 41
 */
static unsigned int primes[] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41 };

void    srand48();
double  drand48();

void init_deck( int *deck );
int find_card( const int rank, const int suit, const int *deck );
void identify_card(const int card, char* result);
void identify_hand(const int *hand, const int n, char* result);

#endif

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


#ifndef RUBY_CARDSLIB_H
#define RUBY_CARDSLIB_H

// Define the modules/classes
VALUE mTechnoGate = Qnil, mCardslib = Qnil, mPoker = Qnil, cCard = Qnil, cCards = Qnil, cPokerCommon = Qnil;

// Prototype for the initialization method - Ruby calls this, not you
void Init_pokerlib_native();

// Prototype for our evaluation functions
VALUE method_init_deck(VALUE self);
VALUE method_find_card(VALUE self, VALUE rank, VALUE suit);
VALUE method_identify_card(VALUE self, VALUE card);
VALUE method_identify_hand(VALUE self, VALUE rHand);
VALUE method_eval_5hand(VALUE self, VALUE c1, VALUE c2, VALUE c3, VALUE c4, VALUE c5);
VALUE method_eval_6hand(VALUE self, VALUE c1, VALUE c2, VALUE c3, VALUE c4, VALUE c5, VALUE c6);
VALUE method_eval_7hand(VALUE self, VALUE c1, VALUE c2, VALUE c3, VALUE c4, VALUE c5, VALUE c6, VALUE c7);
VALUE method_hand_rank(VALUE self, VALUE score);

#endif

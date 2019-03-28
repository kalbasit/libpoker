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

#ifndef RUBY_CARDSLIB_HELPERH
#define RUBY_CARDSLIB_HELPERH

VALUE get_rank_names();

int card_value(VALUE card);

#endif

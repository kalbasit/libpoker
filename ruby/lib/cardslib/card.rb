# -*- encoding : utf-8 -*-
# -*- ruby -*-
#--
#  vim:ft=ruby:fenc=UTF-8:ts=2:sts=2:sw=2:expandtab
#
#  Copyright 2010, 2011 TechnoGate <team@technogate.fr>
#
#  This file is part of Cardslib
#
#  Cardslib is free software: you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation, either version 3 of the License, or (at your option) any later
#  version.
#
#  Cardslib is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
#  PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License along with
#  Cardslib. If not, see http://www.gnu.org/licenses/
#++
####

module TechnoGate
  module Cardslib
    class Card
      SUIT_SYMBOL = {
        :hearts   => '♥',
        :diamonds => '♦',
        :clubs    => '♣',
        :spades   => '♠'
      }

      attr_reader :value, :name

      def initialize(value)
        cards = Cardslib::Cards.new

        @value = value
        @name = cards.identify_card(value)
      end

      def to_i
        @value
      end

      def to_s
        @name
      end

      def take
        @taken = true
        self
      end

      def taken?
        @taken == true
      end

      def draw
        @drawn = true
        self
      end

      def drawn?
        @drawn == true
      end

      def pretty_print
        @name[0] +  case @name[1]
                      when 'h' then SUIT_SYMBOL[:hearts]
                      when 'd' then SUIT_SYMBOL[:diamonds]
                      when 'c' then SUIT_SYMBOL[:clubs]
                      when 's' then SUIT_SYMBOL[:spades]
                    end
      end
    end
  end
end
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
    class Cards

      def initialize
      end

      def deck
        unless @deck
          init_deck
          @deck.shuffle!
        end

        @deck
      end

      def shuffle
        deck unless @deck
        self
      end

      # The method_missing is used to catch whenever a undefined method is called
      # If the undefined method matches one of the ReGEXs, we then call another
      # method, however if the method is not define, we then call the method_missing of the
      # superclass which in turn raises an NoMethodError
      def method_missing(meth, *args, &block)
        return enhanced_find_card $1, $2 if(meth.to_s =~ /^([a-z]*)_of_([a-z]*)/)
        super
      end

      def respond_to?(method_sym, include_private = false)
        if(method_sym.to_s =~ /^([a-z]*)_of_([a-z]*)/)
          begin
            enhanced_find_card $1, $2
            return true
          rescue ArgumentError
            return false
          end
        end

        super
      end

      private

      # This function is used to get a card's value, defined by a rank and a suit,
      # so instead of dealing with endless constants, we use card.XXX_of_XXX
      #
      # [Example]
      #   cards = Cardslib::Cards.new
      #
      #   cards.ace_of_heart  # => 268446761
      #
      #   cards.ace_of_hearts # => 268446761
      #
      #  N.B: The suit can be singular or plural, both are working fine!
      def enhanced_find_card(rank, suit)
        # chop the suit if necessary
        suit.chop! if suit.split('').last == 's'

        # Init deck and shuffle it
        shuffle

        # Find the card in the deck
        begin
          @deck[find_card(Cardslib::Cards.const_get(rank.upcase), Cardslib::Cards.const_get(suit.upcase))]
        rescue NameError
          begin
            Cardslib::Cards.const_get(rank.upcase)
          rescue NameError
            raise ArgumentError, "rank #{rank} does not exist!"
          end

          begin
            Cardslib::Cards.const_get(suit.upcase)
          rescue NameError
            raise ArgumentError, "suit #{suit} does not exist!"
          end
        end
      end

    end
  end
end
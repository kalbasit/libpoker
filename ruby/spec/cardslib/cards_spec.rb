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

require 'spec_helper'

module TechnoGate
  module Cardslib
    describe Cards do
      describe "I should be able to create a new cards (deck)" do
        it "should respond to new" do
          Cards.should respond_to(:new)
        end

        it "should create an object" do
          Cards.new.should be_instance_of TechnoGate::Cardslib::Cards
        end
      end

      describe "I should be able to get a deck, shuffled deck" do
        before(:each) do
          @cards = Cards.new
        end

        it "should have a deck" do
          @cards.should respond_to(:deck)
        end

        it "should have a non-empty deck" do
          @cards.deck.should_not be_empty
        end

        it "should have a deck with exactly 52 cards" do
          @cards.deck.size.should == 52
        end

        it "should have a shuffled deck" do
          @cards.deck.should_not == Cards.new.deck
        end
      end

      describe "I should be able to get cards" do
        before(:each) do
          @cards = Cards.new.shuffle
        end

        it "should respond to ace_of_heart" do
          @cards.should respond_to(:ace_of_heart)
        end

        it "should return 268446761 for ace_of_heart" do
          @cards.ace_of_heart.to_i.should == 268446761
        end

        it "should respond to ace_of_hearts" do
          @cards.should respond_to(:ace_of_hearts)
        end

        it "should return 268446761 for ace_of_hearts" do
          @cards.ace_of_hearts.to_i.should == 268446761
        end
      end

    end
  end
end
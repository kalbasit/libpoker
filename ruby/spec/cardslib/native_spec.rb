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
      describe '#init_deck' do
        before(:each) do
          @cards = Cards.new
        end

        it "should respond to init_deck" do
          @cards.should respond_to :init_deck
        end

        it "should return self" do
          @cards.init_deck.should == @cards
        end

        it "should have a deck" do
          @cards.init_deck.deck.should_not be_empty
        end

        it "should be 52 cards" do
          @cards.init_deck.deck.size.should == 52
        end
      end

      describe "#shuffle" do
        before(:each) do
          @cards = Cards.new
        end

        it "should respond to shuffle" do
          @cards.should respond_to :shuffle
        end

        it "should return self" do
          @cards.init_deck.shuffle == @cards
        end

        it "should have a deck" do
          @cards.init_deck.shuffle.deck.should_not be_empty
        end

        it "should be 52 cards" do
          @cards.init_deck.shuffle.deck.size.should == 52
        end

        it "should have a different deck than the one initialized" do
          init_deck_deck = @cards.init_deck.deck.dup
          @cards.init_deck.shuffle.deck.should_not == init_deck_deck
        end

        it "should have a different deck on each call" do
          first_deck = @cards.init_deck.shuffle.deck
          second_deck = @cards.init_deck.shuffle.deck

          first_deck.should_not == second_deck
        end
      end

      describe '#find_card' do

        before(:each) do
          @cards = Cards.new.shuffle
        end

        it "should respond to find_card" do
          @cards.should respond_to :find_card
        end

        it "should return an instance of Card class" do
          @cards.ace_of_hearts.should be_an_instance_of Card
        end

        it "should return 268446761 for ace of heart" do
          rank = Cards::ACE
          suit = Cards::HEART
          index = @cards.find_card(rank, suit)
          @cards.deck[index].to_i.should eq 268446761
        end

        it "should return 268446761 for ace of heart" do
          @cards.ace_of_heart.to_i.should eq 268446761
        end

        it "should return 268446761 for ace of hearts" do
          @cards.ace_of_hearts.to_i.should eq 268446761
        end

        it "should return Ah for ace of heart" do
          @cards.ace_of_heart.to_s.should eq "Ah"
        end

        it "should return Ah for ace_of_hearts" do
          @cards.ace_of_hearts.to_s.should eq "Ah"
        end

        it "should raise an exception if rank not found" do
          lambda { @cards.acce_of_hearts }.should raise_error ArgumentError
        end

        it "should raise an exception if suit not found" do
          lambda { @cards.ace_of_hhearts }.should raise_error ArgumentError
        end

        it "should raise an exception if the rank is invalid" do
          lambda { @cards.find_card 23, Cards::DIAMOND }.should raise_error ArgumentError
        end

      end

      describe '#identify_card' do

        before(:each) do
          @cards = Cards.new.shuffle
        end

        it "should respond to identify_card" do
          @cards.should respond_to :identify_card
        end

        it "should return 'Ah' for ace of hearts" do
          @cards.identify_card(@cards.ace_of_hearts).should == "Ah"
        end
      end

      describe '#identify_hand' do

        before(:each) do
          @cards = Cards.new.shuffle
        end

        it "should respond to identify_hand" do
          @cards.should respond_to :identify_hand
        end

        it "should return 'AhKhQhJhTh'" do
          @cards.identify_hand([@cards.ace_of_hearts, @cards.king_of_hearts, @cards.queen_of_hearts, @cards.jack_of_hearts, @cards.ten_of_hearts]).should eq "AhKhQhJhTh"
        end
      end

    end

    describe Poker::Common do
      describe 'Poker::Common should inherit from Cards' do
        before(:each) do
          @poker = Poker::Common.new
        end

        it "should inherit from Cards" do
          @poker.should be_kind_of Cards
        end

        [:init_deck, :shuffle, :identify_card, :identify_hand].each do |function|
          it "should respond to #{function.to_s} function provided by C bindings" do
            @poker.should respond_to(function)
          end
        end
      end
    end

  end
end
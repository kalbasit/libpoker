Given /^the library is loaded$/ do
	require 'cardslib'
end

When /^I try to get the version$/ do
  @version = TechnoGate::Cardslib::Version.new
end

Then /^I should be able to get the version$/ do
  @version.to_s.should_not be_empty
end

Then /^I should be able to get the (.*) version$/ do |meth|
  @version.send(meth.to_sym).should_not be_empty
end

Given /^the deck has been shuffled$/ do
  @cards = TechnoGate::Cardslib::Cards.new.shuffle
end

Then /^I should be able to access a deck of (\d+) cards$/ do |number_of_cards|
  @cards.deck.size.should eq number_of_cards.to_i
end

Given /^a (.*) (.*) game has been started$/ do |type, game|
	game_name = game.split(' ').map {|w| w.capitalize}.join('')
	game_type = type.split(' ').map {|w| w.capitalize}.join('')
	@game = instance_eval "TechnoGate::Cardslib::#{game_name}::#{game_type}.new"
end

Then /^I should be able to access the deck$/ do
	@game.deck.should_not be_empty
end

Given /^the native library is loaded$/ do
	require 'cardslib/native'
end

When /^I try to check for (.*)$/ do |class_name|
	@cm = instance_eval class_name
end

Then /^I should find it of class (.*)$/ do |class_type|
	@cm.class.to_s.should == class_type
end

Then /^the superclass is (.*)$/ do |superclass_name|
	@cm.superclass.to_s.should == superclass_name unless superclass_name == '<superclass>'
end

When /^I try to find the card (.*) of (.*)$/ do |rank, suit|
	@find_result = instance_eval "@cards.#{rank.downcase}_of_#{suit.downcase}"
end

When /^I call (.*) on (.*)$/ do |meth, card|
	if card == 'the card'
		@call_on_card_result = @find_result.send(meth.to_sym).to_s
	else
		@call_on_card_result = @cards.send(meth.to_sym, card.to_i)
	end
end

Then /^I should get (.*)$/ do |result|
	@call_on_card_result.should == result
end

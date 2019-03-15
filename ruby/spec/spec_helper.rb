# -*- encoding : utf-8 -*-
####
#
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
#
####

require 'rubygems'
require 'spork'

Spork.prefork do

	$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
	$LOAD_PATH.unshift(File.dirname(__FILE__))
	require 'rspec'
	require 'cardslib'
	include TechnoGate::Cardslib

	# Requires supporting files with custom matchers and macros, etc,
	# in ./support/ and its subdirectories.
	Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

	RSpec.configure do |config|

	end
end

Spork.each_run do
end

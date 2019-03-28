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

# Add Cardslib to PATH
cardslib_path = File.expand_path(File.dirname(__FILE__))
$:.unshift(cardslib_path) if File.directory?(cardslib_path) && !$:.include?(cardslib_path)

# Init our modules
module TechnoGate
  module Cardslib
  end
end

# Include all required files
require 'cardslib/version'
require 'cardslib/native'
require 'cardslib/cards'
require 'cardslib/card'
require 'cardslib/poker'
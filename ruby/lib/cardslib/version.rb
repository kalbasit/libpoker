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
    class Version
      def initialize(version_file = nil)
        version_file = File.expand_path(File.dirname(__FILE__)+"/../../VERSION") unless version_file
        @version = File.exist?(version_file)? File.read(version_file) : ''
      end

      def major
        @version.split('.').first
      end

      def minor
        @version.split('.')[1]
      end

      def patch
        @version.split('.').last
      end

      def to_s
        @version.to_s
      end

      def to_i
        @version.to_i
      end
    end
  end
end
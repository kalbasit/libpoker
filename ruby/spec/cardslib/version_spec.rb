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
    describe Version do

      describe "should respond to :to_s, :to_i, :major, :minor and :patch" do
        before(:each) do
          @version_string = '1.2.3'
          version_file = mock('file_name')

          File.stub!(:exist?).with(version_file).and_return(true)
          File.stub!(:read).with(version_file).and_return(@version_string)

          @version = Version.new(version_file)
        end

        [:to_s, :to_i, :major, :minor, :patch].each do |f|
          it "should respond to #{f}" do
            @version.should respond_to f
          end
        end
      end

      describe "it should parse the version given an existing file with correctly formatted version" do
        before(:each) do
          @version_string = '1.2.3'
          version_file = mock('file_name')

          File.stub!(:exist?).with(version_file).and_return(true)
          File.stub!(:read).with(version_file).and_return(@version_string)

          @version = Version.new(version_file)
        end

        it "should have a version" do
          @version.to_s.should_not be_empty
        end

        it "should have version correctly parsed" do
          @version.to_s.should == @version_string
        end

        it "should have a major version" do
          @version.major.should_not be_empty
        end

        it "should have major version correctly parsed" do
          @version.major.should == @version_string.split('.').first
        end

        it "should have a minor version" do
          @version.minor.should_not be_empty
        end

        it "should have minor version correctly parsed" do
          @version.minor.should == @version_string.split('.')[1]
        end

        it "should have a patch version" do
          @version.patch.should_not be_empty
        end

        it "should have patch version correctly parsed" do
          @version.patch.should == @version_string.split('.').last
        end
      end

    end
  end
end
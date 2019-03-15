# -*- ruby -*-

require 'rake/rdoctask'
require 'rake/clean'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Cardslib #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('AUTHORS*')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.rdoc_files.include('ext/**/*.c')
end

CLEAN.include('rdoc')
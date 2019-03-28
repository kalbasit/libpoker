# -*- ruby -*-

require 'rake/extensiontask'
require 'rake/extensiontesttask'
Rake::ExtensionTask.new('cardslib_native', $gemspec) do |ext|
  #ext.cross_compile   = true
  #ext.cross_platform  = 'x86'
  ext.test_files       = FileList['test/c/*']
  ext.test_lib_folders << ENV['MY_RUBY_HOME']+'/lib' if ENV.include? 'MY_RUBY_HOME'
  ext.test_includes    << ENV['MY_RUBY_HOME']+'/include' if ENV.include? 'MY_RUBY_HOME'
end

CLEAN.include 'lib/**/*.so'

desc("Clean manually generated Makefile and the binaries associated with it")
task :clean_makefile do
  if File.exists?('ext/cardslib_native/Makefile')
    sh 'cd ext/cardslib_native; make clean'
    File.delete('ext/cardslib_native/Makefile')
  end
end

task :clean => :clean_makefile

task :clobber => :clean_makefile
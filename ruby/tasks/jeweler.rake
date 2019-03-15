# -*- ruby -*-

require 'jeweler'
jeweler_tasks = Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name                = "cardslib"
  gem.homepage            = "http://www.technogate.fr/projects/cardslib"
  gem.license             = "GPL"
  gem.summary             = %Q{cardslib evaluates a hand of poker very fast}
  gem.description         = gem.summary
  gem.authors             = ["Wael Nasreddine (TechnoGate)", "Malek Ben Othman (TechnoGate)", "Fatima El-Ouarrat (TechnoGate)", "Kaltouma Jbara (TechnoGate)"]
  gem.email               = ["wael.nasreddine@technogate.fr", "malek.ben.othman@technogate.fr", "fatima.el.ouarrat@technogate.fr", "kaltouma.jbara@technogate.fr"]
  gem.version             = File.exist?('VERSION') ? File.read('VERSION') : ""
  gem.extensions          = FileList['ext/**/extconf.rb']

  #gem.files.include('lib/cardslib_native.*') # add native stuff

  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  gem.add_development_dependency 'rake-compiler', '> 0'
  gem.add_development_dependency 'rake-tasks', '> 0'
  gem.add_development_dependency 'rake-tester', '> 0'
end
Jeweler::RubygemsDotOrgTasks.new

$gemspec         = jeweler_tasks.gemspec
$gemspec.version = jeweler_tasks.jeweler.version

begin
  Jeweler::GemcutterTasks.new
rescue LoadError
end

# Define default tasks and dependencies
task :default => [:compile, :rdoc, :test]
task :test => ['test:c', :spec, :features]
task 'test:c' => :compile
task :spec => :compile
task :features => :compile
task :build => :compile
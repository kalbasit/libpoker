# -*- ruby -*-

desc("Build linux and windows specific gems")
task :gems do
    sh "rake clean compile build"
end
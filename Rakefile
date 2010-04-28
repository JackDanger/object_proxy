begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "object_proxy"
    gem.summary = %Q{An even lighter-weight version of BlankSlate for wrapping Ruby objects}
    gem.description = %Q{Tiny class that defers nearly all method calls to an object of your choice}
    gem.email = "rubygems@6brand.com"
    gem.homepage = "http://github.com/JackDanger/object_proxy"
    gem.authors = ["Jack Danger Canty"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end



task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << '.'
  test.pattern = 'test/test_*.rb'
  test.verbose = true
end

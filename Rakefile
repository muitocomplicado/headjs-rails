require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "headjs-rails"
  gem.homepage = "http://github.com/muitocomplicado/headjs-rails"
  gem.license = "MIT"
  gem.summary = %Q{Provides Rails 3 helper and generator for adding Head JS support.}
  gem.description = %Q{This gem adds a helper and generator to facilitate the use of Head JS in your Rails 3 projects the same way you would normally add javascript tags using Rails default helpers.}
  gem.email = "muitocomplicado@gmail.com"
  gem.authors = ["David Bittencourt"]
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "headjs-rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

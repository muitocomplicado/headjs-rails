# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{headjs-rails}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Bittencourt"]
  s.date = %q{2010-12-02}
  s.description = %q{The HEAD section is the worst place to load scripts. It's painfully slow. The more and the bigger the worse it gets. Move scrips to the bottom and you run into dependency issues and you cannot safely use HTML5 and CSS3. Enter Head JS. A compact solution to these universal issues. This gem adds a helper and generator to facilitate the use of Head JS in your Rails 3 projects the same way you would normally add javascript tags using Rails default helpers.}
  s.email = %q{muitocomplicado@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/generators/headjs/install/install_generator.rb",
    "lib/headjs-rails.rb",
    "lib/headjs-rails/tag_helper.rb",
    "test/helper.rb",
    "test/public/javascripts/jquery.js",
    "test/public/javascripts/rails.js",
    "test/test_tag_helper.rb"
  ]
  s.homepage = %q{http://github.com/muitocomplicado/headjs-rails}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Provides Rails 3 helper and generator for adding Head JS support.}
  s.test_files = [
    "test/helper.rb",
    "test/test_tag_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end


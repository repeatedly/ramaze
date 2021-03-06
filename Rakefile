begin; require 'rubygems'; rescue LoadError; end

require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'time'
require 'date'

PROJECT_SPECS = FileList[
  'spec/{examples,ramaze,snippets}/**/*.rb',
  'lib/proto/spec/*.rb'
]

PROJECT_MODULE      = 'Ramaze'
PROJECT_JQUERY_FILE = 'lib/proto/public/js/jquery.js'
PROJECT_README      = 'README.md'
PROJECT_VERSION     = (ENV['VERSION'] || Date.today.strftime('%Y.%m.%d')).dup
PROJECT_COPYRIGHT   = [
  "#          Copyright (c) #{Time.now.year} Michael Fellinger m.fellinger@gmail.com",
  "# All files in this distribution are subject to the terms of the Ruby license."
]

DEPENDENCIES = {
  'innate' => {:version => '>= 2010.03'},
}

DEVELOPMENT_DEPENDENCIES = {
  "abstract"   	            => {:version => "1.0.0"},
  "addressable"             => {:version => "2.1.1"},
  "bacon"                   => {:version => "1.1.0"},
  "builder"                 => {:version => "2.1.2"},
  "dalli"                   => {:version => "1.0.5"},
  "erector"                 => {:version => "0.8.2"},
  "erubis"                  => {:version => "2.6.5"},
  "ezamar"                  => {:version => "2009.06"},
  "haml"                    => {:version => "2.2.22"},
  "hpricot"                 => {:version => "0.8.2"},
  "json"                    => {:version => "1.2.3"},
  "less"                    => {:version => "1.2.21"},
  "liquid"                  => {:version => "2.0.0"},
  "locale"                  => {:version => "2.0.5"},
  "lokar"                   => {:version => "0.1.0"},
  "maruku"                  => {:version => "0.6.0"},
  "mustache"                => {:version => "0.9.2"},
  "mutter"                  => {:version => "0.5.3"},
  "nagoro"                  => {:version => "2009.05"},
  "rack-contrib"            => {:version => "0.9.2", :lib => 'rack/contrib'},
  "rack-test"               => {:version => "0.5.3", :lib => 'rack/test'},
  "RedCloth"                => {:version => "4.2.3"},
  "Remarkably"              => {:version => "0.5.2", :lib => 'remarkably'},
  "RubyInline"              => {:version => "3.8.4"},
  "scaffolding_extensions"  => {:version => "1.4.0"},
  "sequel"                  => {:version => "3.9.0"},
  "slippers"                => {:version => "0.0.14"},
  "sqlite3-ruby"            => {:version => "1.2.5", :lib => 'sqlite3'},
  "tagz"                    => {:version => "7.2.3"},
  "tenjin"                  => {:version => "0.6.1"},
}

# Localmemcache doesn't work properly on OS X so we should ignore it
if !RUBY_PLATFORM.include? 'darwin'
  DEVELOPMENT_DEPENDENCIES['localmemcache'] = {:version => "0.4.4"}
end

GEMSPEC = Gem::Specification.new{|s|
  s.name         = 'ramaze'
  s.author       = "Michael 'manveru' Fellinger"
  s.summary      = "Ramaze is a simple and modular web framework"
  s.description  = s.summary
  s.email        = 'm.fellinger@gmail.com'
  s.homepage     = 'http://ramaze.net'
  s.version      = PROJECT_VERSION
  s.files        = `git ls-files`.split("\n").sort
  s.executables  = ["ramaze"]
  s.required_rubygems_version = '>= 1.3.5'

  s.post_install_message = <<MESSAGE.strip
============================================================
Thank you for installing Ramaze!
To create a new project:
$ ramaze create yourproject
============================================================
MESSAGE
}

DEPENDENCIES.each do |name, options|
  GEMSPEC.add_dependency(name, options[:version])
end

DEVELOPMENT_DEPENDENCIES.each do |name, options|
  GEMSPEC.add_development_dependency(name, options[:version])
end

Dir['tasks/*.rake'].each{|f| import(f) }

task :default => [:bacon]

CLEAN.include %w[
  **/.*.sw?
  *.gem
  .config
  **/*~
  **/{data.db,cache.yaml}
  *.yaml
  pkg
  rdoc
  ydoc
  *coverage*
]

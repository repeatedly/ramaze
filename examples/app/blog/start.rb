$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'app'

Ramaze.start :adapter => :webrick, :mode => :dev

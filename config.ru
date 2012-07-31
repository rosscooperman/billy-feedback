require 'rubygems'
require 'bundler'

Bundler.require

require './feedback'

use Rack::Reloader
run Feedback
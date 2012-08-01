require 'rubygems'
require 'bundler'
Bundler.require

$: << File.dirname(__FILE__)

require 'config/initializers/sinatra'
require 'config/initializers/carrierwave'
require 'config/initializers/mongoid'
require 'lib/image_uploader'
require 'lib/item'
require 'lib/feedback'

use Rack::Reloader
run Feedback
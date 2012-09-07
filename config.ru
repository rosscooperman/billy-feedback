require File.expand_path('../config/boot', __FILE__)

# require the main feedback application
require 'application'

use Rack::Reloader
run Application

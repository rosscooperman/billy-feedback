require File.expand_path('../config/boot', __FILE__)

# require the main feedback application
require 'feedback'

use Rack::Reloader
run Feedback

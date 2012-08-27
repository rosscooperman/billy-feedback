RACK_ENV = ENV['RACK_ENV'] || 'development'

require 'yaml'
require 'rubygems'
require 'bundler'
Bundler.require(:default, RACK_ENV.to_sym)

APP_ROOT = File.expand_path('../..', __FILE__)
$: << File.expand_path('lib', APP_ROOT)

# require anything in the config/initializers directory
Dir[File.expand_path('config/initializers/*.rb', APP_ROOT)].each do |file|
  require file
end

# get active_record up and running
database_yml = File.expand_path('config/database.yml', APP_ROOT)
ActiveRecord::Base.establish_connection(YAML::load_file(database_yml)[RACK_ENV])


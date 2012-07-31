require 'sinatra'
# require 'shotgun'
require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

#define model
class Feedback
	include DataMapper::Resource

	property :id, Serial
	property :token, String
	property :text, String

end

DataMapper.auto_upgrade! # migrate automatically

get '/' do
  "Thank you for using Billy!"
end

get '/new' do
	erb :form
end

post '/form' do
	"Items: '#{params[:message]}'  Key:   '#{params[:key]}'"
end

# get '/feedback/:key/:content' do
# 	@key = params[:key]
# 	@content = params[:content]
# end


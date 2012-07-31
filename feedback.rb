require 'rubygems'
require 'bundler/setup'


Mongoid.load!("config/mongoid.yml", :development)
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

#define model
class Item
	include Mongoid::Document

	field :token, type: String
	field :content, type: String
end

#define uploader
class ImageUploader < CarrierWave::Uploader::Base
	storage :file
end

# class Image
# 	include DataMapper::Resource

# 	property :id, Serial

# 	mount_uploader :source, ImageUploader
# end

# DataMapper.auto_upgrade! # migrate automatically

class Feedback < Sinatra::Base
	get '/' do
	  erb :form
	end


	post '/form' do
		item = Item.new
		item.attributes = params
		item.save

		redirect "/view/#{item.id}"
	end


	get '/view' do
		erb :list, :locals => { :items => Item.all }
	end

	get '/view/:id' do
		item = Item.find(params[:id])
		erb :show, :locals => { :item => item }
	end
end

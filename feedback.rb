require 'rubygems'
require 'bundler/setup'

Mongoid.load!("config/mongoid.yml", :development)

#define uploader
class ImageUploader < CarrierWave::Uploader::Base
	storage :file     # :fog for production
end

#define model
class Item
	include Mongoid::Document

	field :token, type: String
	field :content, type: String
	mount_uploader :image, ImageUploader
	mount_uploader :cropped_image, ImageUploader
end



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

	get '/view/?' do
		erb :list, :locals => { :items => Item.all }
	end

	get '/view/:id' do
		item = Item.find(params[:id])
		erb :show, :locals => { :item => item }
	end
end

#%r{/view/?} 
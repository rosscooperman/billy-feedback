require 'rubygems'
require 'bundler/setup'

Mongoid.load!("config/mongoid.yml", :development)

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJNU5CLXDPYM3ZZVQ',
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'billyup-feedback'
end

#define uploader
class ImageUploader < CarrierWave::Uploader::Base
	storage :fog     # :fog for production

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
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

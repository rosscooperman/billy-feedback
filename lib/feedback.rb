class Feedback < Sinatra::Base
	set :views, File.join(File.dirname(__FILE__),'..','views') 

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

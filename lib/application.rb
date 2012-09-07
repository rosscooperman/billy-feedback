require 'active_support/core_ext/string'

require 'image_uploader'
require 'feedback'

class Application < Sinatra::Base
  configure do
    set :public_folder, File.join(APP_ROOT, 'public')
    set :views, File.join(APP_ROOT, 'views')

    disable :static
    enable :logging
  end

  configure :development do
    enable :static
  end

  get '/' do
    redirect to('/feedback')
  end

  get '/feedback/?' do
    erb :index, :locals => { :feedback => Feedback.all }
  end

  get '/feedback/:id/raw' do |id|
    feedback = Feedback.find(id)
    erb :raw, :locals => { :feedback => feedback }
  end

  get '/feedback/create/?' do
    erb :create
  end

  post '/feedback' do
    feedback = Feedback.create(params['feedback'])

    if request.referrer.match(/create$/)
      if feedback.valid?
        redirect to('/feedback')
      else
        erb :create
      end
    else
      status (item.save) ? 201 : 400
    end
  end
end


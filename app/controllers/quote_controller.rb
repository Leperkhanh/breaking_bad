require './config/environment'

class QuotesController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/quotes/" do
    erb :welcome
  end

end
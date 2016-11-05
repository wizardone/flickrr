class Flickrr < Sinatra::Base
  get '/register' do
    haml :register
  end

  post '/register' do
    puts params
  end
end

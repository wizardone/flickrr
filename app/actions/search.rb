class Flickrr < Sinatra::Base
  get '/search' do
    haml :search
  end
end

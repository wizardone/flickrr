class Flickrr < Sinatra::Base
  get '/gallery' do
    haml :gallery
  end
end

class Flickrr < Sinatra::Base
  get '/logout' do
    session[:user_id] = nil
    redirect '/'
  end
end

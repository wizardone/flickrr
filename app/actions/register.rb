class Flickrr < Sinatra::Base
  get '/register' do
    haml :register
  end

  post '/register' do
    @user = User.new(params[:user])
    if @user.save
      redirect '/gallery'
    else
      # TODO: add the proper messages
      flash[:error] = 'Email or Password are invalid'
      redirect :register
    end
  end
end

class Flickrr < Sinatra::Base
  get '/login' do
    haml :login, layout: :form
  end

  post '/login' do
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      flash[:message] = 'Login successful!'
      session[:user_id] = @user.id
      redirect '/gallery'
    else
      # TODO: add the proper messages
      flash[:error] = 'Email or Password are invalid'
      redirect :login
    end
  end
end


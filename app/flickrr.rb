require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/activerecord'

require_relative '../config/boot'
require_relative '../config/application'

class Flickrr < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  set :database_file, File.expand_path('../config/database.yml', __dir__)
  set :root,  File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, 'views') }

  enable :sessions

  before do
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  before %r{/(gallery)|(search)} do
    redirect to('/login') if @current_user.nil?
  end

  get '/' do
    @random_image_url = FlickrService
                        .new
                        .recent_photo
                        .medium_url

    haml :main
  end
end

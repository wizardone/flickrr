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
    return if Config::SESSION_FREE_PAGES.include?(request.path)

    unless session[:user_id]
      halt "There is no active session, please <a href='/login'>Login</a> or <a href='/register'>Register</a>"
    end
  end

  get '/' do
    "Hi there!"
  end
end

require_relative 'actions/register'
require_relative 'actions/gallery'

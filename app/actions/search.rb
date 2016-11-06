require 'will_paginate'
require 'will_paginate/array'
require 'byebug'
class Flickrr < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  get '/search' do
    if params[:search].try(:[], :text)
      search_query = params[:search][:text]
      @current_user.histories.create(data: search_query)
      @photos ||= FlickrService.new.photos(text: search_query)
        .paginate(page: params[:page], per_page: Config::PAGINATION_PER_PAGE)

      haml :search
    else
      redirect to('/gallery')
    end
  end
end


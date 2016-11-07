require 'flickr.rb'
class FlickrService
  attr_reader :service

  def initialize
    @service = Flickr.new(ENV['FLICKR_API_KEY'])
  end

  # Fetches the original photos returned by the Flickr API
  # and transform them into domain friendly objects
  def photos(criteria = {})
    original_photos = service.photos(criteria)
    original_photos.map { |original_photo| Picture.from_flickr(original_photo) }
  end

  def recent_photo
    photo = service.recent.first
    Picture.from_flickr(photo)
  end
end

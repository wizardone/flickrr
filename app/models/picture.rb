class Picture
  attr_reader :params

  def initialize(**params)
    @params = params
  end

  def url
    "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}"
  end

  private

  def id
    params[:id]
  end

  def farm_id
    params[:farm_id]
  end

  def server_id
    params[:server_id]
  end

  def secret
    params[:secret]
  end
end

#Dir[[File.expand_path('../', __dir__), 'actions/*.rb'].join('/')].each do |file|
#  require file
#end

Dir[[File.expand_path('../', __dir__), 'models/*.rb'].join('/')].each do |file|
  require file
end

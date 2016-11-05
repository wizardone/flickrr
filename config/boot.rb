Dir[[File.expand_path('../', __dir__), 'app/actions/*.rb'].join('/')].each do |file|
  require file
end

Dir[[File.expand_path('../', __dir__), 'app/models/*.rb'].join('/')].each do |file|
  require file
end

# Load all the actions
Dir[[File.expand_path('../', __dir__), 'app/actions/*.rb'].join('/')].each do |file|
  require file
end

# Load all the models
Dir[[File.expand_path('../', __dir__), 'app/models/*.rb'].join('/')].each do |file|
  require file
end

# Load all the services (only one currently)
Dir[[File.expand_path('../', __dir__), 'app/services/*.rb'].join('/')].each do |file|
  require file
end

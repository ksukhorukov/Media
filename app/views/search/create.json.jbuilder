json.links @result do |result|
  json.name result.name
  json.link request.protocol + request.host_with_port + item_path(result)
end
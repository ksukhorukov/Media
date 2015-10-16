json.links @result do |result|
  json.name result.name
  json.link request.protocol + request.host_with_port + router_path(result.id)
end
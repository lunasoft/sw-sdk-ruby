require 'net/http'
require_relative 'auth_response.rb'

class SwAuthentication
  def self.authentication(url, user, password)
    url = URI(url + "/security/authenticate")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["user"] = user
    request["password"] = password
    response = http.request(request)
    response_obj = AuthResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end 
end
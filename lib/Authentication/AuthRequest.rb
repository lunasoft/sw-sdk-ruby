require 'net/http'
require_relative 'AuthResponse.rb'

class SWauthentication

  def self.authentication(cUri, cUser, cPassword)
    url = URI(cUri+"/security/authenticate")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["user"] = cUser
    request["password"] = cPassword
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    respuestaObj = AuthResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end 
end
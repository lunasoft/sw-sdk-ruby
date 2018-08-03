require 'net/http'
require 'json'

class SWauthentication
  # Funcion de autenticación, requiere URL, Usuario y Password
  def self.authentication(cUri, cUser, cPassword)
    url = URI(cUri+"/security/authenticate")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["user"] = cUser
    request["password"] = cPassword
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    responseBody = JSON.parse(response.read_body)
    if(responseBody['status'] == 'success')
      Services::setToken(responseBody['data']['token'])
        return responseBody['data']['token']
    else
        return responseBody
    end
  end 
end
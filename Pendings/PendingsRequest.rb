require 'net/http'
require_relative 'PendingsResponse.rb'

class SWpendings

  def self.pendings(cURL, cToken, cRFC)
    url = URI(cURL+"/pendings/"+cRFC)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'application/json'
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    respuestaObj = PendingsResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end
end
require 'net/http'
require 'json'

class SWaccountBalance
  
  def self.accountBalance(cURL, cToken)
    url = URI(cURL+"/account/balance")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'application/json'
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    return response.read_body
  end
end
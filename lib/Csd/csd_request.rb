require 'net/http'
require 'securerandom'
require_relative '../Response/generic_response.rb'

class SwCsd
  def self.upload_csd(url, token, is_active, certificate_type, password, csd, key)
    url = URI(url + "/csd/save")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer ' + token
    request["Cache-Control"] = 'no-cache'
    request.body = '{"is_active": "' + is_active.to_s + '", "password": "' + password + '", "certificate_type": "' + certificate_type + '", "b64Cer": "' + csd + '", "b64Key": "' + key + '"}'
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end
require 'net/http'
require 'json'
require 'securerandom'
require_relative '../Response/generic_response.rb'

class SwStamp
  def self.stamp(url, token, version, xml, base64)
    b64 = ""
    if base64
      b64 = '/b64/' 
    end
    boundary = '----' + SecureRandom.urlsafe_base64
    body = "--" + boundary + "\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n" + xml + "\r\n--" + boundary + "--"
    url = URI(url+"/cfdi33/stamp/"+version+b64)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer ' + token
    request["Content-Type"] = 'multipart/form-data; boundary="' + boundary + '"'
    request["Cache-Control"] = 'no-cache'
    request["Content-length"] = body.length
    request.body = body
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end
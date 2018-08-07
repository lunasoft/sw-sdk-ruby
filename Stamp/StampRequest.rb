require 'net/http'
require 'json'
require 'securerandom'
require_relative 'StampResponse.rb'

class SWstamp

  def self.stamp(cURL, cToken, cVersion, cXML, cBase64)

    b64 = ""
    if cBase64 == true
      b64 = '/b64/' 
    end
    boundary = '----' + SecureRandom.urlsafe_base64
    
    cbody = "--" + boundary + "\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n--" + boundary + "--"
    url = URI(cURL+"/cfdi33/stamp/"+cVersion+b64)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer ' + cToken
    request["Content-Type"] = 'multipart/form-data; boundary="' + boundary + '"'
    request["Cache-Control"] = 'no-cache'
    request["Content-length"] = cbody.length
    request.body = cbody
    response = http.request(request)
    respuestaObj = StampResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end

  def self.stampJson(cUri, cToken, cVersion, cXML, c_base64)

    b64 = ""
    if c_base64 == true
      b64 = '/b64/'
    end
    url = URI(cUri+"/cfdi33/stamp/json/"+cVersion+b64)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+ cToken
    request["Content-Type"] = 'application/json'
    request["Cache-Control"] = 'no-cache'
    request.body = '{ "data": "'+cXML+'"}'
    response = http.request(request)
    respuestaObj = StampResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end
end
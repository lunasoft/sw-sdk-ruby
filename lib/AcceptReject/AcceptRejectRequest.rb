require 'net/http'
require 'json'
require 'securerandom'
require_relative 'AcceptRejectResponse.rb'

class SWacceptreject

  def self.acceptrejectbyuuid(cURL, cToken, cUUID, cRFC, cAction)
    url = URI(cURL+"/acceptreject/"+cRFC+"/"+cUUID+"/"+cAction)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    respuestaObj = AcceptRejectResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end
 
  def self.acceptrejectbycsd(cURL, cToken, cUUIDS, cRFC, cPassword, cB64CSD, cB64Key)
    url = URI(cURL+"/acceptreject/csd")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuids": '+JSON.generate(cUUIDS)+', "password": "'+cPassword+'", "rfc": "'+cRFC+'", "b64Cer": "'+cB64CSD+'", "b64Key": "'+cB64Key+'"}'
    response = http.request(request)
    respuestaObj = AcceptRejectResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end

  def self.acceptrejectbypfx(cURL, cToken, cUUIDS, cRFC, cPassword, cB64PFX)
    url = URI(cURL+"/acceptreject/pfx")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuids": '+JSON.generate(cUUIDS)+', "password": "'+cPassword+'", "rfc": "'+cRFC+'", "b64Pfx": "'+cB64PFX+'"}'
    response = http.request(request)
    respuestaObj = AcceptRejectResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end

  def self.acceptrejectbyxml(cURL, cToken, cXML)
    url = URI(cURL+"/acceptreject/xml")
    boundary =  '----' + SecureRandom.urlsafe_base64
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data;boundary="' + boundary + '"'
    request["Cache-Control"] = 'no-cache'
    request.body = "--" + boundary + "\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n--" + boundary + "--"
    response = http.request(request)
    respuestaObj = AcceptRejectResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj) 
  end
end
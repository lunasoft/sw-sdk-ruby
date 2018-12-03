require 'net/http'
require 'securerandom'
require_relative 'RelationsResponse.rb'

class SWrelations

  def self.relationsbyuuid(cURL, cToken, cUUID, cRFC)
    url = URI(cURL+"/relations/"+cRFC+"/"+cUUID)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    respuestaObj = RelationsResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end
 
  def self.relationsbycsd(cURL, cToken, cUUID, cRFC, cPassword, cB64CSD, cB64Key)
    url = URI(cURL+"/relations/csd")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuid": "'+cUUID+'", "password": "'+cPassword+'", "rfc": "'+cRFC+'", "b64Cer": "'+cB64CSD+'", "b64Key": "'+cB64Key+'"}'
    response = http.request(request)
    respuestaObj = RelationsResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end

  def self.relationsbypfx(cURL, cToken, cUUID, cRFC, cPassword, cB64PFX)
    url = URI(cURL+"/relations/pfx")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuid": "'+cUUID+'", "password": "'+cPassword+'", "rfc": "'+cRFC+'", "b64Pfx": "'+cB64PFX+'"}'
    response = http.request(request)
    respuestaObj = RelationsResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end

  def self.relationsbyxml(cURL, cToken, cXML)
    url = URI(cURL+"/relations/xml")
    boundary =  '----' + SecureRandom.urlsafe_base64
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data;boundary="' + boundary + '"'
    request["Cache-Control"] = 'no-cache'
    request.body = "--" + boundary + "\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n--" + boundary + "--"
    response = http.request(request)
    respuestaObj = RelationsResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj) 
  end
end
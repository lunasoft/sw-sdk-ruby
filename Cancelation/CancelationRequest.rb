require 'net/http'
require 'json'
require 'securerandom'

class SWcancelation
  
  def self.cancelbyuuid(cURL, cToken, cRFC, cUUID)
    url = URI(cURL+"/cfdi33/cancel/"+cRFC+"/"+cUUID)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    return response.read_body 
  end
  
  def self.cancelbycsd(cURL, cToken, cUUID, cRFC, cPassword, cB64CSD, cB64Key)
    url = URI(cURL+"/cfdi33/cancel/csd")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuid": "'+cUUID+'", "password": "'+cPassword+'", "rfc": "'+cRFC+'", "b64Cer": "'+cB64CSD+'", "b64Key": "'+cB64Key+'"}'
    response = http.request(request)
    return response.read_body
  end
  
  def self.cancelbypfx(cURL, cToken, cUUID, cRFC, cPassword, cB64PFX)
    url = URI(cURL+"/cfdi33/cancel/pfx")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuid": "'+cUUID+'", "password": "'+cPassword+'", "rfc": "'+cRFC+'", "b64Pfx": "'+cB64PFX+'"}'
    response = http.request(request)
    return response.read_body
  end
  
  def self.cancelbyxml(cURL, cToken, cXML)
    url = URI(cURL+"/cfdi33/cancel/xml")
    boundary = SecureRandom.hex
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["content"] = 'multipart/form-data'
    request["Cache-Control"] = 'no-cache'
    request.body = "------" + boundary + "\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml.xml\"\r\nContent-Type: \r\n"+cXML+"\r\n------" + boundary + "--"
    response = http.request(request)
    return response.read_body  
  end
end
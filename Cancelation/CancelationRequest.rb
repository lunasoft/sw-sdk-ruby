require 'net/http'
require 'json'

class SWcancelation
  # Cancelación por UUID, recibe strings URL, Token, RFC Emisor, UUID
  def self.cancelbyuuid(cURL, cToken, cRFC, cUUID)
    url = URI(cURL+"/cfdi33/cancel/"+cRFC+"/"+cUUID)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    return response.read_body 
  end
  # Cancelación por CSD recibe strings URL, Token, UUID, RFC Emisor, Password, CSD en base64, Key en base64
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
  # Cancelación por PFX recibe strings URL, Token, UUID, RFC Emisor, Password, PFX en base64
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
  # Cancelación por XML recibe URL, Token, XML de Tipo Cancelación
  def self.cancelbyxml(cURL, cToken, cXML)
    url = URI(cURL+"/cfdi33/cancel/xml")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["content"] = 'multipart/form-data'
    request["Cache-Control"] = 'no-cache'
    request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml.xml\"\r\nContent-Type: \r\n"+cXML+"\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"
    response = http.request(request)
    return response.read_body  
  end
end
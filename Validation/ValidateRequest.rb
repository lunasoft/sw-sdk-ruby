require 'net/http'
require 'json'
require_relative 'ValidateResponse.rb'
require 'securerandom'



class SWvalidate

  def self.validatexml(cURL, cToken, cXML)
    boundary =  '----' + SecureRandom.urlsafe_base64
    cbody = '--' + boundary + '\r\nContent-Type: text/xml'+"\r\n"+'Content-Transfer-Encoding: binary'+"\r\n"+'Content-Disposition: form-data; name="xml"; filename="33.xml"'+"\r\n\r\n"+cXML+"\r\n"'--' + boundary + '--  '
    url = URI(cURL+"/validate/cfdi33")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data; boundary="' + boundary + '"'
    request["Content-Length"] = cbody.length 
    request["Cache-Control"] = 'no-cache'
    request.body = cbody
    response = http.request(request)
    respuestaObj = ValidateResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end

  def self.validatelrfc(cURL, cToken, cLRFC)
    url = URI(cURL+"/lrfc/"+cLRFC)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    respuestaObj = ValidateResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end

  def self.validatenocertificado(cURL, cToken, cNoCert)
    url = URI(cURL+"/lco/"+cNoCert)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    respuestaObj = ValidateResponse.new(response)
    return respuestaObj.validateStatusCode(respuestaObj)
  end
end
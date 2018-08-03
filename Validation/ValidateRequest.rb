require 'net/http'
require 'json'

# Clase para Validaciones
class SWvalidate
  # Valida XML recibe strings URL, Token y XML
  def self.validatexml(cURL, cToken, cXML)
    cbody = '------=_Part_3_6510431.1490229284095\r\nContent-Type: text/xml'+"\r\n"+'Content-Transfer-Encoding: binary'+"\r\n"+'Content-Disposition: form-data; name="xml"; filename="33.xml"'+"\r\n\r\n"+cXML+"\r\n"'------=_Part_3_6510431.1490229284095--  '
    url = URI(cURL+"/validate/cfdi33")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data; boundary="----=_Part_3_6510431.1490229284095"'
    request["Content-Length"] = cbody.length 
    request["Cache-Control"] = 'no-cache'
    request.body = cbody
    response = http.request(request)
    return response.read_body
  end
  # Validar LRFC recibe strings URL, Token y LRFC
  def self.validatelrfc(cURL, cToken, cLRFC)
    url = URI(cURL+"/lrfc/"+cLRFC)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    return response.read_body
  end
  # Validar NoCertificado recibe strings URL, Token y NoCertificado
  def self.validatenocertificado(cURL, cToken, cNoCert)
    url = URI(cURL+"/lco/"+cNoCert)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    return response.read_body
  end
end
require 'net/http'
require 'json'

class SWstamp
  # Función de timbrado, recibe Strings URL, Token, Versión de timbrado, XML y bolean True/False base64
  def self.stamp(cURL, cToken, cVersion, cXML, cBase64 = false)

    b64 = ""
    if cBase64 == true
      b64 = '/b64/' 
    end
    cbody = "------=_Part_11_11939969.1490230712432\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n------=_Part_11_11939969.1490230712432--"
    url = URI(cURL+"/cfdi33/stamp/"+cVersion+b64)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data; boundary="----=_Part_11_11939969.1490230712432"'
    request["Cache-Control"] = 'no-cache'
    request["Content-length"] = cbody.length
    request.body = cbody
    response = http.request(request)
    puts response.read_body
  end
  # Función de timbrado en JSON, recibe Strings URL, Token, Versión de timbrado, XML y bolean True/False base64
  def self.stampJson(cUri, cToken, cVersion, cXML, c_base64 = false)

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
    return response.read_body
  end
  # Función de emisión-timbrado, recibe Strings URL, Token, Versión de timbrado, XML y bolean True/False base64
  def self.issue(cURL, cToken, cVersion, cXML, cBase64 = false)

    b64 = ""
    if cBase64 == true
      b64 = '/b64/' 
    end
    url = URI(cURL+"/cfdi33/issue/"+cVersion+b64)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+cToken
    request["Content-Type"] = 'multipart/form-data; boundary="----=_Part_11_11939969.1490230712432"'
    request["Cache-Control"] = 'no-cache'
    request.body = "------=_Part_11_11939969.1490230712432\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n------=_Part_11_11939969.1490230712432--"
    response = http.request(request)
    puts response.read_body
  end
  # Función de emisión-timbrado en JSON, recibe Strings URL, Token, Versión de timbrado, XML y bolean True/False base64
  def self.issueJson(cUri, cToken, cVersion, cXML, cBase64 = false)

    b64 = ""
    if cBase64 == true
      b64 = '/b64/' 
    end
    url = URI(cUri+"/cfdi33/issue/json/"+cVersion+b64)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer '+ cToken
    request["Content-Type"] = 'application/json'
    request["Cache-Control"] = 'no-cache'
    request.body = '{ "data": "'+cXML+'"}'
    response = http.request(request)
    return response.read_body
  end
end
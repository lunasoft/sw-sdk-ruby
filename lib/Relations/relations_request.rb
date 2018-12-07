require 'net/http'
require 'securerandom'
require_relative '../Response/generic_response.rb'

class SwRelations

  def self.relations_uuid(url, token, uuid, rfc)
    url = URI(url + "/relations/" + rfc + "/" + uuid)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer ' + token
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
 
  def self.relations_csd(url, token, uuid, rfc, password, csd, key)
    url = URI(url + "/relations/csd")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer ' + token
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuid": "' + uuid + '", "password": "' + password + '", "rfc": "' + rfc + '", "b64Cer": "' + csd + '", "b64Key": "' + key + '"}'
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.relations_pfx(url, token, uuid, rfc, password, pfx)
    url = URI(url + "/relations/pfx")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'application/json'
    request["Authorization"] = 'bearer ' + token
    request["Cache-Control"] = 'no-cache'
    request.body = '{"uuid": "' + uuid + '", "password": "' + password + '", "rfc": "' + rfc + '", "b64Pfx": "' + pfx + '"}'
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.relations_xml(url, token, xml)
    url = URI(url + "/relations/xml")
    boundary =  '----' + SecureRandom.urlsafe_base64
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer ' + token
    request["Content-Type"] = 'multipart/form-data;boundary="' + boundary + '"'
    request["Cache-Control"] = 'no-cache'
    request.body = "--" + boundary + "\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n" + xml + "\r\n--" + boundary + "--"
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj) 
  end
end
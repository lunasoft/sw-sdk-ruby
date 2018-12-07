require 'net/http'
require 'json'
require_relative '../Response/generic_response.rb'
require 'securerandom'

class SwValidate
  def self.validate_xml(url, token, xml)
    boundary =  '----' + SecureRandom.urlsafe_base64
    cbody = '--' + boundary + '\r\nContent-Type: text/xml'+"\r\n" + 'Content-Transfer-Encoding: binary'+"\r\n"+'Content-Disposition: form-data; name="xml"; filename="33.xml"' + "\r\n\r\n" + xml + "\r\n"'--' + boundary + '--  '
    url = URI(url+"/validate/cfdi33")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = 'bearer ' + token
    request["Content-Type"] = 'multipart/form-data; boundary="' + boundary + '"'
    request["Content-Length"] = cbody.length 
    request["Cache-Control"] = 'no-cache'
    request.body = cbody
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.validate_LRFC(url, token, rfc)
    url = URI(url + "/lrfc/" + rfc)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer ' + token
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.validate_LCO(url, token, num_cert)
    url = URI(url + "/lco/" + num_cert)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer ' + token
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end
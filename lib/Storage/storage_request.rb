require 'net/http'
require_relative '../Response/generic_response.rb'

class SwStorage
  def self.get_xml_uuid(url, token, uuid)
    url = URI("#{url}/datawarehouse/v1/live/#{uuid}")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["Authorization"] = 'bearer ' + token
    request["Content-Type"] = 'application/json'
    request["Cache-Control"] = 'no-cache'
    response = http.request(request)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end
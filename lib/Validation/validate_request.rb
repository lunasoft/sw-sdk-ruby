require 'json'
require_relative '../Response/generic_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwValidate
  def self.validate_xml(url, token, xml)
    endpoint = URI(url+"/validate/cfdi33")
    response = RequestHelper.post_multipart_request(endpoint,token,xml)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end

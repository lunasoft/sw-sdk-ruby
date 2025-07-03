require_relative '../Response/generic_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwStorage
  def self.get_xml_uuid(url, token, uuid)
    endpoint = URI("#{url}/datawarehouse/v1/live/#{uuid}")
    response = RequestHelper.get_json_request(endpoint,token)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end

require_relative '../Response/generic_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwPendings
  def self.pendings(url, token, rfc)
    endpoint = URI(url + "/pendings/" + rfc)
    response = RequestHelper.get_json_request(endpoint,token)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end

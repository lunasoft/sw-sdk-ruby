require_relative '../Response/generic_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwStamp
  def self.stamp(url, token, version, xml, base64)
    b64 = ""
    if base64
      b64 = '/b64/'
    end
    endpoint = URI(url+"/cfdi33/stamp/"+version+b64)
    response = RequestHelper.post_multipart_request(endpoint,token,xml)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end

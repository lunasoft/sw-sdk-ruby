require_relative '../Response/generic_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwIssue
  def self.issue(url, token, version, xml, base64)
    b64 = ""
    if base64
      b64 = '/b64/'
    end
    endpoint = URI(url + "/cfdi33/issue/" + version + b64)
    response = RequestHelper.post_multipart_request(endpoint,token,xml)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.issue_JSON(url, token, version, json)
    endpoint = URI(url + "/v3/cfdi33/issue/json/" + version)
    response = RequestHelper.post_jsontoxml_request(endpoint,token,json)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end

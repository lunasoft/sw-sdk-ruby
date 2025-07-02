require_relative '../Response/generic_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwAcceptReject

  def self.accept_reject_uuid(url, token, uuid, rfc, action)
    endpoint = URI(url + "/acceptreject/" + rfc + "/" + uuid + "/" + action)
    response = RequestHelper.post_json_request(endpoint,token)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.accept_reject_csd(url, token, uuids, rfc, password, csd, key)
    endpoint = URI(url + "/acceptreject/csd")
    payload = {
        "uuids": uuids,
        "password": password,
        "rfc": rfc,
        "b64Cer": csd,
        "b64Key": key
    }
    response = RequestHelper.post_json_request(endpoint,token,payload)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.accept_reject_pfx(url, token, uuids, rfc, password, pfx)
    endpoint = URI(url + "/acceptreject/pfx")
    payload = {
        "uuids": uuids,
        "password": password,
        "rfc": rfc,
        "b64Pfx": pfx
    }
    response = RequestHelper.post_json_request(endpoint,token,payload)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.accept_reject_xml(url, token, xml)
    endpoint = URI(url + "/acceptreject/xml")
    response = RequestHelper.post_multipart_request(endpoint,token,xml)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end

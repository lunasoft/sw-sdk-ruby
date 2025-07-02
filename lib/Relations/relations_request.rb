require 'net/http'
require 'securerandom'
require_relative '../Response/generic_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwRelations

  def self.relations_uuid(url, token, uuid, rfc)
    endpoint = URI(url + "/relations/" + rfc + "/" + uuid)
    response = RequestHelper.post_json_request(endpoint,token)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.relations_csd(url, token, uuid, rfc, password, csd, key)
    endpoint = URI(url + "/relations/csd")
    payload = {
      "uuid": uuid,
      "password": password,
      "rfc": rfc,
      "b64Cer": csd,
      "b64Key": key
    }
    response = RequestHelper.post_json_request(endpoint,token,payload)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.relations_pfx(url, token, uuid, rfc, password, pfx)
    endpoint = URI(url + "/relations/pfx")
    payload = {
      "uuid": uuid,
      "password": password,
      "rfc": rfc,
      "b64Pfx": pfx
    }
    response = RequestHelper.post_json_request(endpoint,token,payload)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end

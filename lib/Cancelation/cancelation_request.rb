require_relative '../Response/generic_response.rb'
require_relative '../Helpers/request_helper.rb'

class SwCancelation
  def self.cancel_uuid(url, token, uuid, rfc, motivo, folio_sustitucion)
    endpoint = URI("#{url}/cfdi33/cancel/#{rfc}/#{uuid}/#{motivo}/#{folio_sustitucion}")
    response = RequestHelper.post_json_request(endpoint,token)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.cancel_csd(url, token, uuid, rfc, password, csd, key, motivo, folio_sustitucion)
    endpoint = URI(url + "/cfdi33/cancel/csd")
    payload = {
        "uuid": uuid,
        "password": password,
        "rfc": rfc,
        "motivo": motivo,
        "foliosustitucion": folio_sustitucion,
        "b64Cer": csd,
        "b64Key": key
    }
    response = RequestHelper.post_json_request(endpoint,token,payload)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.cancel_pfx(url, token, uuid, rfc, password, pfx, motivo, folio_sustitucion)
    endpoint = URI(url + "/cfdi33/cancel/pfx")
    payload = {
        "uuid": uuid,
        "password": password,
        "rfc": rfc,
        "motivo": motivo,
        "foliosustitucion": folio_sustitucion,
        "b64Pfx": pfx
    }
    response = RequestHelper.post_json_request(endpoint,token,payload)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end

  def self.cancel_xml(url, token, xml)
    endpoint = URI(url + "/cfdi33/cancel/xml")
    response = RequestHelper.post_multipart_request(endpoint,token,xml)
    response_obj = GenericResponse.new(response)
    return response_obj.validate_status_code(response_obj)
  end
end

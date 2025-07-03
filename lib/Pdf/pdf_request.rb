require_relative 'pdf_response.rb'
require_relative '../Helpers/request_helper.rb'

class SWPdf
    def self.pdf(url, token, xml, template_id,b64Logo = nil, extras = nil)
        endpoint = URI(url + "/pdf/v1/api/GeneratePdf")
        payload = {'xmlContent': xml,'logo': b64Logo, 'extras':extras, 'templateId':template_id}
        response = RequestHelper.post_json_request(endpoint,token,payload)
        response_obj = PdfResponse.new(response)
        return response_obj.validate_status_code(response_obj)
    end
end

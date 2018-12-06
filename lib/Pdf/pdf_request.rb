require 'net/http'
require 'securerandom'
require_relative 'pdf_response.rb'

class SWPdf
    def self.pdf(url, token, xml, template_id = "3a12dabd-66fa-4f18-af09-d1efd77ae9ce", extras = nil)
        boundary = '----' + SecureRandom.urlsafe_base64
        cbody = "--" + boundary + "\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"file\"; filename=\"xml\"\r\n\r\n" + xml + "\r\n--" + boundary + "--"
        url = URI(url + "/pdf/v1/generate/")
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Post.new(url)
        request["Authorization"] = 'bearer ' + token
        request["TemplateId"] = template_id
        request["Content-Type"] = 'multipart/form-data; boundary="' + boundary + '"'
        request["Cache-Control"] = 'no-cache'
        request["Content-length"] = cbody.length
        request.body = cbody
        response = http.request(request)
        response_obj = PdfResponse.new(response)
        return response_obj.validate_status_code(response_obj)
    end
end
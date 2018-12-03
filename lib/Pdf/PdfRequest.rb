require 'net/http'
require 'securerandom'
require_relative 'PdfResponse.rb'

class SWPdf
    def self.pdf(cURL, cToken, cXML, cTemplateId = "3a12dabd-66fa-4f18-af09-d1efd77ae9ce", cExtras = nil)
        boundary = '----' + SecureRandom.urlsafe_base64
        cbody = "--" + boundary + "\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"file\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n--" + boundary + "--"
        url = URI(cURL+"/pdf/v1/generate/"+cVersion+b64)
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Post.new(url)
        request["Authorization"] = 'bearer ' + cToken
        request["TemplateId"] = cTemplateId
        request["Content-Type"] = 'multipart/form-data; boundary="' + boundary + '"'
        request["Cache-Control"] = 'no-cache'
        request["Content-length"] = cbody.length
        request.body = cbody
        response = http.request(request)
        respuestaObj = PdfResponse.new(response)
        return respuestaObj.validateStatusCode(respuestaObj)
    end
end
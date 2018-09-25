require 'net/http'
require 'securerandom'
require_relative 'PdfResponse.rb'

class SWpendings
    def self.pdf(cURL, cToken, cXML, cTemplateId, cExtras)
        boundary = '----' + SecureRandom.urlsafe_base64
        cbody = "--" + boundary + "\r\nContent-Type: text/xml\r\nContent-Transfer-Encoding: binary\r\nContent-Disposition: form-data; name=\"xml\"; filename=\"xml\"\r\n\r\n"+cXML+"\r\n--" + boundary + "--"
        url = URI(cURL+"/cfdi33/stamp/"+cVersion+b64)
        http = Net::HTTP.new(url.host, url.port)
        request = Net::HTTP::Post.new(url)
        request["Authorization"] = 'bearer ' + cToken
        request["Content-Type"] = 'multipart/form-data; boundary="' + boundary + '"'
        request["Cache-Control"] = 'no-cache'
        request["Content-length"] = cbody.length
        request.body = cbody
        response = http.request(request)
        respuestaObj = PdfResponse.new(response)
        return respuestaObj.validateStatusCode(respuestaObj)
    end
end
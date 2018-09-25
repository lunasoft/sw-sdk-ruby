require 'net/http'
require_relative 'StatusCfdiResponse.rb'

class SWstatuscfdi
    def self.status(cURL, cAction, cRFCEmisor, cRFCReceptor, cTotal,cUUID)
        data = <<-EOF
        <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
        <soapenv:Header/>
        <soapenv:Body>
           <tem:Consulta>
              <!--Optional:-->
              <tem:expresionImpresa><![CDATA[?re=#{cRFCEmisor.encode(:xml => :attr)}&rr=#{cRFCReceptor.encode(:xml => :attr)}&tt=#{cTotal}&id=#{cUUID}]]></tem:expresionImpresa>
           </tem:Consulta>
        </soapenv:Body>
     </soapenv:Envelope>
    EOF

    url = URI(cURL+"?wsdl")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = 'text/xml; charset=utf-8'
    request["SOAPAction"] = cAction
    request.body = data
    response = http.request(request)
    return StatusCfdiResponse.new(response)
    end
end
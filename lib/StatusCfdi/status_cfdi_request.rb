require 'net/http'
require 'net/https'
require_relative 'status_cfdi_response.rb'

class SwStatusCfdi
  def self.status(url, action, rfc_emisor, rfc_receptor, total, uuid)
    data = <<-EOF
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">
      <soapenv:Header/>
      <soapenv:Body>
        <tem:Consulta>
          <tem:expresionImpresa><![CDATA[?re=#{rfc_emisor.encode(xml: :text)}&rr=#{rfc_receptor.encode(xml: :text)}&tt=#{total}&id=#{uuid}]]></tem:expresionImpresa>
        </tem:Consulta>
      </soapenv:Body>
    </soapenv:Envelope>
    EOF

    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = uri.scheme == 'https'
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    request = Net::HTTP::Post.new(uri)
    request['Content-Type'] = 'text/xml; charset=utf-8'
    request['SOAPAction'] = action
    request.body = data

    response = http.request(request)
    response.body.force_encoding('UTF-8')

    StatusCfdiResponse.new(response)
  end
end

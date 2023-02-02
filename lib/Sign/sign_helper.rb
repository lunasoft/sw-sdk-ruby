require 'nokogiri'
require 'openssl'
require 'base64'

class SignHelper
    def self.get_cadena_original(xml)
        xml_doc = Nokogiri::XML(xml)
        xslt_doc = Nokogiri::XSLT(File.open("resources/xslt/cadenaoriginal_4_0.xslt"))
        return xslt_doc.transform(xml_doc)
    end
    def self.get_sello(cadena, pfx, password)
        pfx_pkcs = OpenSSL::PKCS12.new(pfx, password)
        private_key = pfx_pkcs.key
        cert = pfx_pkcs.certificate
        digest = OpenSSL::Digest::SHA256.new
        signature = private_key.sign(digest, cadena)
        return Base64.encode64(signature)
    end
    def self.get_certificate(pfx, password)
        pfx_pkcs = OpenSSL::PKCS12.new(pfx, password)
        cert = pfx_pkcs.certificate
        return Base64.strict_encode64(cert.to_der)
    end
    def self.get_numero_certificado(cert_b64)
        cert_der = Base64.decode64(cert_b64)
        cert = OpenSSL::X509::Certificate.new(cert_der)
        serial_number = cert.serial.to_s(16)
        result = ""
        serial_number.each_char.each_slice(2) do |pair|
        result << pair.join.to_i(16).chr
        end
        return result
    end
    def self.create_pfx(certificate, private_key, password)
        cert = OpenSSL::X509::Certificate.new(certificate)
        pkey = OpenSSL::PKey::RSA.new(private_key, password)
        pfx = OpenSSL::PKCS12.create(password, "certificate", pkey, cert)
        return pfx.to_der
    end
    def self.get_comprobante_node(xml_doc)
        comprobante_node = xml_doc.at_xpath("//cfdi:Comprobante", { "cfdi" => "http://www.sat.gob.mx/cfd/4" })
        return comprobante_node
    end
end
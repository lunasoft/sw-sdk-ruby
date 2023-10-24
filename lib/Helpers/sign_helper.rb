require 'nokogiri'
require 'openssl'
require 'base64'

class SignHelper
    def self.get_cadena_original(xml, is_tfd = false)
        xml_doc = Nokogiri::XML(xml)
        xslt_doc = !is_tfd ? Nokogiri::XSLT(File.open(File.join(__dir__, "../../resources/xslt/cadenaoriginal_4_0.xslt")))
                            : Nokogiri::XSLT(File.open("../../resources/xslt/cadenaoriginal_TFD_1_1.xslt"))
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
    def self.get_comprobante_node(xml_doc)
        comprobante_node = xml_doc.at_xpath("//cfdi:Comprobante", { "cfdi" => "http://www.sat.gob.mx/cfd/4" })
        return comprobante_node
    end
end

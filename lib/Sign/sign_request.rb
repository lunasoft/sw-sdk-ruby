require 'nokogiri'
require_relative '../Helpers/sign_helper.rb'
require_relative '../Helpers/certificate_helper.rb'

class SignService
    def self.sign_cfdi(xml, pfx, password)
        cert = CertificateHelper::get_certificate(pfx, password)
        cert_number = CertificateHelper::get_numero_certificado(cert)
        xml_doc = Nokogiri::XML(xml)
        comprobante_node = SignHelper::get_comprobante_node(xml_doc)
        comprobante_node['Certificado'] = cert
        comprobante_node['NoCertificado'] = cert_number
        cadena = SignHelper::get_cadena_original(xml_doc.to_xml())
        sello = SignHelper::get_sello(cadena, pfx, password)
        comprobante_node["Sello"] = sello
        return xml_doc.to_xml(:indent => 2, :save_with => Nokogiri::XML::Node::SaveOptions::AS_XML)
    end
    def self.create_pfx(certificate, private_key, password)
        return CertificateHelper::create_pfx(certificate, private_key, password)
    end
end
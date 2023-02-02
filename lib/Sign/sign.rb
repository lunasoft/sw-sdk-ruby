require 'nokogiri'
require_relative 'sign_helper.rb'
class Sign
    def self.sign_cfdi(xml, pfx, password)
        cert = SignHelper::get_certificate(pfx, password)
        cert_number = SignHelper::get_numero_certificado(cert)
        xml_doc = Nokogiri::XML(xml)
        comprobante_node = SignHelper::get_comprobante_node(xml_doc)
        comprobante_node['Certificado'] = cert
        comprobante_node['NoCertificado'] = cert_number
        cadena = SignHelper::get_cadena_original(xml)
        sello = SignHelper::get_sello(cadena, pfx, password)
        comprobante_node["Sello"] = sello
        return xml_doc.to_xml(:indent => 2, :save_with => Nokogiri::XML::Node::SaveOptions::AS_XML)
    end

    def self.create_pfx(certificate, private_key, password)
        return SignHelper::create_pfx(certificate, private_key, password)
    end
end
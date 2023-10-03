require_relative '../../lib/Sign/sign.rb'

class TestHelper
    def self.read_file(file_name)
        file = File.open(file_name, "r")
        data = file.read()
        file.close
        return data
    end
    def self.get_cfdi(xml)
        xml_doc = Nokogiri::XML(xml)
        comprobante_node = xml_doc.at_xpath("//cfdi:Comprobante", { "cfdi" => "http://www.sat.gob.mx/cfd/4" })
        date = Time.now - 7200
        comprobante_node['Fecha'] = date.strftime("%Y-%m-%dT%H:%M:%S")
        return xml_doc.to_xml(:indent => 2, :save_with => Nokogiri::XML::Node::SaveOptions::AS_XML)
    end
    def self.get_signed_cfdi(xml, pfx, password)
        xml_doc = Nokogiri::XML(xml)
        comprobante_node = xml_doc.at_xpath("//cfdi:Comprobante", { "cfdi" => "http://www.sat.gob.mx/cfd/4" })
        date = Time.now - 7200
        comprobante_node['Fecha'] = date.strftime("%Y-%m-%dT%H:%M:%S")
        comprobante_node['Serie'] = "SW-Sdk-Ruby"
        comprobante_node['Folio'] = SecureRandom.uuid
        xml_signed = Sign::sign_cfdi(xml_doc.to_xml(:indent => 2, :save_with => Nokogiri::XML::Node::SaveOptions::AS_XML), pfx, password)
        return xml_signed
    end

    def self.create_pfx
        cert_file = File.binread("../Resources/csd/csd.cer")
        pkey_file = File.binread("../Resources/csd/csd.key")
        password = "12345678a"
        return Sign::create_pfx(cert_file, pkey_file, password)
    end
end